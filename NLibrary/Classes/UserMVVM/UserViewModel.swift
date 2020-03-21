//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
//

protocol SignUpVCprotocol : class {
    func SuccessfulSignIn()
    func UnsuccessfulSignIn(message: String)
}

class UserVM {
    var id: String?
    var name: String?
    var email: String?
    weak var signUpVC: SignUpVCprotocol?
    weak var userRepo: UserRepoProtocol?
    
    init( viewController: SignUpVCprotocol, userRepo: UserRepoProtocol) {
        self.signUpVC = viewController
        self.userRepo = userRepo
    }
}
