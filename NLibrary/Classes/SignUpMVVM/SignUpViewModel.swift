//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

//----------------------------------------

public class SignUpViewModel: SignUpViewModelProtocol {
    weak var signUpVC: SignUpViewControllerProtocol?
    private var signUpRepo: SignUpRepoProtocol?

    required public init( viewController: SignUpViewControllerProtocol,
                          signUpRepo: SignUpRepoProtocol) {
        self.signUpVC = viewController
        self.signUpRepo = signUpRepo
        signUpRepo.setViewModel(userVM: self)
    }

    public func signUp(email: String!, password: String!) {
        signUpRepo!.signUpAndAddNewUser(email: email, password: password)
    }

    public func successfullRequest() {
        self.signUpVC?.successfulSignIn()
    }

    public func unsuccessfulRequest(errorMessage: String) {
        self.signUpVC?.unsuccessfulSignIn(message: errorMessage)
    }
}
