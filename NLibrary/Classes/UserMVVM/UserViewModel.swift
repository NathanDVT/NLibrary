//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
//---------------------------------------- SignUp Protocol

public protocol SignUpVCprotocol: class {
    func successfulSignIn()
    func unsuccessfulSignIn(message: String)
}

//----------------------------------------

public class UserVM {
    var userId: String?
    var name: String?
    var email: String?
    weak var signUpVC: SignUpVCprotocol?
    var userRepo: UserRepoProtocol?

    public init( viewController: SignUpVCprotocol, userRepo: UserRepoProtocol) {
        self.signUpVC = viewController
        self.userRepo = userRepo
        userRepo.setViewModel(userVM: self)
    }

    public func signUp(email: String!, password: String!) {
        guard let userRepo = userRepo else {
            fatalError()
        }
        userRepo.signUp(email: email, password: password) { result in
            switch result {
            case .failedRequest(let message):
                self.signUpVC?.unsuccessfulSignIn(message: message)
            case .succesfullRequest:
                self.signUpVC?.successfulSignIn()
            }
        }
    }
}
