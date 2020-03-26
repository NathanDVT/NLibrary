//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public enum APIRequestResult: Error {
    case failedRequest(message: String)
    case succesfullRequest
}

class FirebaseService {
    private var ref: DatabaseReference! = Database.database().reference()
    private var repo: SignUpRepoProtocol?
    
    init(repo: SignUpRepoProtocol) {
        self.repo = repo
    }
    
    func getUser() {
        ref = Database.database().reference()
    }
    
    func signIn(email: String, password: String, completion: @escaping(APIRequestResult) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            guard let _ = authResult?.user, error == nil else {
                completion(.failedRequest(message: error!.localizedDescription))
                return
            }
            completion(.succesfullRequest)
        }
    }
    
    private func signUp(email: String, password: String, completion: @escaping(APIRequestResult) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
        guard let _ = authResult?.user, error == nil else {
            //Failure
            completion(.failedRequest(message: error!.localizedDescription))
            return
        }
        //Success
        completion(.succesfullRequest)
        }
    }
    
    func signUpAndAddNewUser(email: String, password: String, newUser: UserModel) {
        // Attempt to sign user into application
        signUp(email: email, password: password) { [weak self] result in
            switch result {
                case .failedRequest(let message):
                    self?.repo?.failedSignUp(errorMessage: message)
                case .succesfullRequest:
                    // Successful sign in, attempt to add user details to database
                    self?.addUserToDB(newUser: newUser) { [weak self] result2 in
                        switch result2 {
                        case .failedRequest(let message):
                            self?.repo?.failedSignUp(errorMessage: message)
                        case .succesfullRequest:
                            self?.repo?.successfulSignUp()
                        }
                }
            }
        }
    }
    
    private func addUserToDB(newUser: UserModel, completion: @escaping(APIRequestResult) -> Void) {
        self.ref.child("users").child(Auth.auth().currentUser!.uid).setValue(newUser.dict) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
            print("Data could not be saved: \(error).")
            } else {
            print("Data saved successfully!")
                completion(.succesfullRequest)
            }
        }
    }
}
