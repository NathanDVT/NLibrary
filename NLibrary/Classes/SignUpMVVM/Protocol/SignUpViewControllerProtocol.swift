//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

//---------------------------------------- SignUp Protocol

public protocol SignUpViewControllerProtocol: class {
    func successfulSignIn()
    func unsuccessfulSignIn(message: String)
}
