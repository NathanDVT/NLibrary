//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public enum APIRequestResult: Error {
    case failedRequest(message: String)
    case succesfullRequest
}

@objc public class FirebaseService: NSObject, FirebaseServiceProtocol {
    private let ref: DatabaseReference! = Database.database().reference()
    private var repo: SignUpRepoProtocol?
    private var repoSignIn: LoginRepoProtocol?
    private var repoSearch: SearchSongRepoProtocol?
    private var repoDashBoard: DashboardRepoProtocol?
    private var repoPlaylist: PlaylistRepo?

    public required init(repo: SignUpRepoProtocol) {
        self.repo = repo
    }

    public required init(repo: PlaylistRepo) {
        self.repoPlaylist = repo
    }

    public required init(repo: SearchSongRepoProtocol) {
        self.repoSearch = repo
    }

    required public init(repo: DashboardRepoProtocol) {
        self.repoDashBoard = repo
    }

    @objc required public init(repoSignIn: LoginRepoProtocol) {
        self.repoSignIn = repoSignIn
    }

    @objc public func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
            guard authResult?.user != nil, error == nil else {
                self?.repoSignIn!.unsuccessfulSign(in: error?.localizedDescription)
                return
            }
            self?.repoSignIn!.successfulSignIn()
        }
    }

    public func signIn(email: String, password: String, completion: @escaping(APIRequestResult) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {/*[weak self]*/ authResult, error in
            guard authResult?.user != nil, error == nil else {
                completion(.failedRequest(message: error!.localizedDescription))
                return
            }
            completion(.succesfullRequest)
        }
    }

    public func signUpAndAddNewUser(email: String, password: String) {
        // Attempt to sign user into application
        self.signUp(email: email, password: password) { [weak self] result in
            switch result {
            case .failedRequest(let message):
                self?.repo?.failedSignUp(errorMessage: message)
            case .succesfullRequest:
                // Successful sign in, attempt to add user details to database
                var user: UserModel = UserModel()
                user.uid = Auth.auth().currentUser!.uid
                user.email = email
                self?.addUserToDB(newUser: user) { [weak self] result2 in
                    switch result2 {
                    case .failedRequest(let message):
                        self?.repo?.failedSignUp(errorMessage: message)
                    case .succesfullRequest:
                        self?.repo?.successfulSignUp()
                    }
                }
            }
        }
    }

    public func addUserToDB(newUser: UserModel, completion: @escaping(APIRequestResult) -> Void) {
        self.ref.child("users").child(Auth.auth().currentUser!.uid)
            .setValue(newUser.dict) { (error: Error?, _: DatabaseReference) in
            if error != nil {
                completion(.failedRequest(message: "Unable to add user account, please try again"))
            } else {
                completion(.succesfullRequest)
            }
        }
    }

    public func signUp(email: String, password: String, completion: @escaping(APIRequestResult) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {_, error in
        if error != nil {
            //Failure
            completion(.failedRequest(message: error!.localizedDescription))
        } else {
            //Success
            completion(.succesfullRequest)
            }
        }
    }

    public func addSongToRecent(songDTO: RecentSongModel) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        self.removeSongFromRecent(playlistName: "Recent", song: songDTO) { result in
            switch result {
            default:
                self.ref.child("Playlists")
                     .child(currentUser.uid)
                     .child("Recent")
                     .childByAutoId()
                     .updateChildValues(songDTO.dict) { [weak self](error: Error?, _: DatabaseReference) in
                     if error != nil {
                     } else {
                         self?.createPlaylist(playlistName: "Recent")
                     }
                 }
            }
        }
    }

    public func addSongToPlaylist(playlistName: String, songDTO: RecentSongModel) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        self.removeSongFromRecent(playlistName: playlistName, song: songDTO) { result in
            switch result {
            default:
                self.ref.child("Playlists")
                     .child(currentUser.uid)
                     .child(playlistName)
                     .childByAutoId()
                     .updateChildValues(songDTO.dict) { [weak self](error: Error?, _: DatabaseReference) in
                     if error != nil {
                     } else {
                         self?.createPlaylist(playlistName: playlistName)
                     }
                 }
            }
        }
    }

    public func getUserPlaylistsNames() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(currentUser.uid)/Playlists")
            .queryOrderedByKey().observe(.value, with: { [weak self] (snapshot) in
            let value = snapshot.value as? NSDictionary
            guard value != nil else {
                // TO DO: playlist could not be loaded
                return
            }
            self?.repoSearch!.successfulUserPlaylistNames(dictionary: value!)
        })
    }

    public func createPlaylist(playlistName: String) {
        checkIfPlaylistExists(playlistName: playlistName) { result in
            switch result {
            case .failedRequest:
                break
            case .succesfullRequest:
                guard let currentUser = Auth.auth().currentUser else {
                    return
                }
                self.ref.child("users").child(currentUser.uid)
                .child("Playlists").childByAutoId().updateChildValues(["playlistId": playlistName])
            }
        }
    }

    private func checkIfPlaylistExists(playlistName: String, completion: @escaping(APIRequestResult) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let myref = self.ref.child("users").child(currentUser.uid).child("Playlists")
            .queryOrdered(byChild: "playlistId").queryEqual(toValue: playlistName)
        myref.observe(.value, with: { (snapshot) in
            if snapshot.hasChildren() {
                completion(.failedRequest(message: "Already exits"))
            } else {
                completion(.succesfullRequest)
            }
        })
    }

    private func removeSongFromRecent(playlistName: String,
                                      song: RecentSongModel,
                                      completion: @escaping(APIRequestResult) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let myref = self.ref.child("Playlists").child(currentUser.uid).child(playlistName)
            .queryOrdered(byChild: "previewUrl").queryEqual(toValue: song.previewUrl)
        myref.observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
            if snapshot.hasChildren() {
                for songToRemove in snapshot.children {
                    guard let snapShotToDelete = songToRemove as? DataSnapshot else {
                        return
                    }
        self?.ref.child("Playlists/\(currentUser.uid)/\(playlistName)/\(snapShotToDelete.key)")
            .removeValue {(_: Error?, _: DatabaseReference) in
                        completion(.succesfullRequest)
                    }
                }
            } else {
                completion(.succesfullRequest)
            }
        })
    }

    public func getDashboardItems() {
        getUserNameToDashboard()
        getRecentSongsToDashboard()
    }

    public func getUserNameToDashboard() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        self.ref.child("users/\(currentUser.uid)").observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
            let value = snapshot.value as? NSDictionary
            guard value != nil else {
                // TO DO: name could not be loaded
                return
            }
            self?.repoDashBoard!.successFulNameRequest(dictionary: value!)
        })
    }

    public func getRecentSongsToDashboard() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        self.ref.child("Playlists/\(currentUser.uid)/Recent")
            .queryOrderedByKey().queryLimited(toLast: 3).observe(.value, with: { [weak self] (snapshot) in
            let value = snapshot.value as? NSDictionary
            guard value != nil else {
                // TO DO: playlist could not be loaded
                return
            }
            self?.repoDashBoard!.successFulRecentPlaylistRequest(dictionary: value!)
        })
    }

    public func getUserPlaylistDetails() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        self.ref.child("Playlists/\(currentUser.uid)")
            .observe(.value, with: { [weak self] (snapshot) in
                let value = [snapshot.key: snapshot.value!] as NSDictionary
            self?.repoPlaylist!.successfulGetUserPlaylists(dictionary: value)
        })
    }

    public func logout() {
        do {
            // TO DO: cancel observers hanging
            try Auth.auth().signOut()
            self.repoDashBoard!.successfulLogOut()
        } catch {
        }
    }
}
