//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public protocol SignUpViewModelProtocol: class {
    init( viewController: SignUpViewControllerProtocol, signUpRepo: SignUpRepoProtocol)
    func signUp(email: String!, password: String!)
    func successfullRequest()
    func unsuccessfulRequest(errorMessage: String)
}
