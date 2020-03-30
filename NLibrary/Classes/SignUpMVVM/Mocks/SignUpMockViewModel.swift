//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class SignUpMockViewModel: SignUpViewModelProtocol {
    public var email: String = ""
    public var password: String = ""
    public var errorMessage: String = ""
    public var successfulRequestCalled: Bool = false
    weak var signUpVC: SignUpViewControllerProtocol?
    private var signUpRepo: SignUpRepoProtocol?

    required public init( viewController: SignUpViewControllerProtocol,
                          signUpRepo: SignUpRepoProtocol) {
    }

    public func signUp(email: String!, password: String!) {
        self.email = email
        self.password = password
    }

    public func successfullRequest() {
        successfulRequestCalled = true
    }

    public func unsuccessfulRequest(errorMessage: String) {
        self.errorMessage = errorMessage
    }
}
