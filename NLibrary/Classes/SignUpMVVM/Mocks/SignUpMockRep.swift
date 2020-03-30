//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//
import Foundation
import FirebaseAuth

public class SignUpMockRepo: SignUpRepoProtocol {
    public var signUpVM: SignUpViewModelProtocol?
    public var email: String = ""
    public var password: String = ""
    public init () {}

    lazy var signInService: FirebaseServiceProtocol = {return FirebaseService(repo: self)}()

    public func setViewModel(userVM: SignUpViewModelProtocol) {
    }

    public func failedSignUp(errorMessage: String) {

    }

    public func successfulSignUp() {
    }

    public func signUpAndAddNewUser(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    public func setServiceProvider(service: FirebaseServiceProtocol) {
    }
}
