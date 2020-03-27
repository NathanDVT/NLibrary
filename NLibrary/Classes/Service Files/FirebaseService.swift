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

@objc public class FirebaseService: NSObject {
    private var ref: DatabaseReference! = Database.database().reference()
    private var repo: SignUpRepoProtocol?
    private var repoSignIn: LoginRepoProtocol?

    init(repo: SignUpRepoProtocol) {
        self.repo = repo
    }

    @objc public init(repoSignIn: LoginRepoProtocol) {
        self.repoSignIn = repoSignIn
    }

    @objc func getUser() {
        ref = Database.database().reference()
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
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
            guard authResult?.user != nil, error == nil else {
                completion(.failedRequest(message: error!.localizedDescription))
                return
            }
            completion(.succesfullRequest)
        }
    }

    func signUpAndAddNewUser(email: String, password: String) {
        // Attempt to sign user into application
        self.signUp(email: email, password: password) { [weak self] result in
            switch result {
            case .failedRequest(let message):
                self?.repo?.failedSignUp(errorMessage: message)
            case .succesfullRequest:
                // Successful sign in, attempt to add user details to database
                var user: UserModel = UserModel()
                user.uid = Auth.auth().currentUser!.uid
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

    private func addUserToDB(newUser: UserModel, completion: @escaping(APIRequestResult) -> Void) {
        self.ref.child("users").child(Auth.auth().currentUser!.uid)
            .setValue(newUser.dict) { (error: Error?, _: DatabaseReference) in
            if error != nil {
                completion(.failedRequest(message: "Unable to add user account, please try again"))
            } else {
                completion(.succesfullRequest)
            }
        }
    }

    private func signUp(email: String, password: String, completion: @escaping(APIRequestResult) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
        if error != nil {
            //Failure
            completion(.failedRequest(message: error!.localizedDescription))
        }
        //Success
            completion(.succesfullRequest)
        }
    }
}
