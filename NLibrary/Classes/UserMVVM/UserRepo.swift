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

public enum APIRequestResult: Error {
    case failedRequest(message: String)
    case succesfullRequest
}

public protocol UserRepoProtocol: class {
    func signUp (email: String, password: String, completion: @escaping(APIRequestResult) -> Void)
    func nothing()
    func setViewModel(userVM: UserVM)
}

public class UserRepo: UserRepoProtocol {
    var userVM: UserVM?

    public init () {}

    public func nothing() {}

    public func signUp(email: String, password: String, completion: @escaping(APIRequestResult) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { /*[weak self]*/ authResult, error in
            guard let user = authResult?.user, error == nil else {
                completion(.failedRequest(message: error!.localizedDescription))//message: error!.localizedDescription
                return
            }
            completion(.succesfullRequest)
        }
    }

    public func setViewModel(userVM: UserVM) {
        self.userVM = userVM
    }
}
