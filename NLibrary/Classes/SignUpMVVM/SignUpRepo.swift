//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//
import Foundation
import FirebaseAuth

public class SignUpRepo: SignUpRepoProtocol {
    var signUpVM: SignUpViewModel?

    public init () {}

    lazy var signInService: FirebaseService = {return FirebaseService(repo: self)}()

    public func setViewModel(userVM: SignUpViewModel) {
        self.signUpVM = userVM
    }

    public func failedSignUp(errorMessage: String) {
        signUpVM?.unsuccessfulRequest(errorMessage: errorMessage)
    }

    public func successfulSignUp() {
        signUpVM?.successfullRequest()
    }

    public func signUpAndAddNewUser(email: String, password: String) {
        signInService.signUpAndAddNewUser(email: email, password: password)
    }
}
