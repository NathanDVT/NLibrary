//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import Firebase

protocol UserRepoProtocol: class {
    func signIn(email: String, password: String)
}

class UserRepo: UserRepoProtocol {
    func signIn(email: String, password: String) {
        Auth.auth().createUser(withEmail: email,
                               password: password) { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                self?.showMessagePrompt(title: "Opps!", message: error!.localizedDescription)
              return
            }
            self?.showMessagePrompt(title: "Success", message: "User \(user.email) successfully created")
        }
    }
}
