//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public protocol SignUpRepoProtocol: class {
    func signUpAndAddNewUser (email: String, password: String)
    func setViewModel(userVM: SignUpViewModel)
    func failedSignUp(errorMessage: String)
    func successfulSignUp()
}
