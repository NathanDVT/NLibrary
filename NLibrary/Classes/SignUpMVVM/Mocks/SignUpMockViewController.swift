//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class SignUpMockViewController: SignUpViewControllerProtocol {
    var successfulSignInCalled: Bool = false
    var unsuccessMessage: String = ""
    public init() {

    }
    public func successfulSignIn() {
        successfulSignInCalled = true
    }
    public func unsuccessfulSignIn(message: String) {
        unsuccessMessage = message
    }
}
