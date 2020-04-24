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

//public enum APIRequestResult: Error {
//    case failedRequest(message: String)
//    case succesfullRequest
//}

public protocol FirebaseServiceProtocol: NSObject {

    init()
    init(repo: SignUpRepoProtocol)

    init(repo: SearchSongRepoProtocol)

    init(repo: DashboardRepoProtocol)

    init(repoSignIn: LoginRepoProtocol)

    func signIn(email: String, password: String)

    func signIn(email: String, password: String, completion: @escaping(APIRequestResult) -> Void)

    func signUpAndAddNewUser(email: String, password: String)

    func addUserToDB(newUser: UserModel, completion: @escaping(APIRequestResult) -> Void)

    func signUp(email: String, password: String, completion: @escaping(APIRequestResult) -> Void)
    func addSongToRecent(songDTO: RecentSongModel)

    func createPlaylist(playlistName: String)

    func getDashboardItems()

    func getUserNameToDashboard()

    func getRecentSongsToDashboard()
//    func getUserProfile(completion: @escaping(Result<NSDictionary, APIRequestResult>) -> Void)
    func logout()
    func getUserPlaylistsNames()
}
