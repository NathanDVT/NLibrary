//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//
import Foundation

protocol DictionaryConvertible {
    init?(dict: [String: Any])
    var dict: [String: Any] { get }
}

public struct UserModel: DictionaryConvertible {

    var uid: String = "N/A"
    var name: String = "N/A"
    var email: String = "N/A"
    var playListIds: [String] = []
    var followers: [String] = []
    var photoUrl: String = "N/A"

    var dict: [String: Any] {
        return [
            "uid": uid,
            "name": name,
            "email": email,
            "playListIds": playListIds as NSArray,
            "followers": followers as NSArray,
            "photoUrl": "N/A"
        ]
    }

    init() {
    }

    init?(dict: [String: Any]) {
        /*
         TO DO: add functionality to receive objects from Firebase Database reference
         snapshotsguard let userID = dict["userID"] as? String, email = dict["email"]
         as? String, creationDate = dict["creationDate"] as? String else { return nil
            }
         */
        self.init()
    }
}
