//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//
import Foundation
//import Firebase
import FirebaseAuth

enum APIRequestResult: Error {
    case failedRequest(message: String)
    case succesfullRequest
}

protocol UserRepoProtocol: class {
    func signIn (email: String, password: String, completion: @escaping(Result<APIRequestResult, APIRequestResult>) -> Void)
}

class UserRepo: UserRepoProtocol {
    func signIn(email: String, password: String, completion: @escaping(Result<APIRequestResult, APIRequestResult>) -> Void) {
        Auth.auth().createUser(withEmail: email,
                               password: password) { /*[weak self]*/ authResult, error in
            guard let user = authResult?.user, error == nil else {
                completion(.failure(.failedRequest(message: error!.localizedDescription))) //message: error!.localizedDescription
                return
            }
            completion(.success(.succesfullRequest))
        }
    }
}
