//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//
import Foundation

protocol DictionaryConvertible {
    init?(dict:[String:Any])
    var dict:[String:Any] { get }
}

struct UserModel: DictionaryConvertible {
    
    init() {
    }
    
    init?(dict: [String : Any]) {
//        guard let userID = dict["userID"] as? String, email = dict["email"] as? String, creationDate = dict["creationDate"] as? String else {
//            return nil
//        }
        self.init()
    }
    
    var uid: String = "Empty"
    var name: String = "Empty"
    var email: String = "Empty"
    var playListIds: [String] = ["track", "trap"]
    var followers: [String] = []
    var photoUrl: String = "Empty"
    
    func getUserDict() {
        
    }
    
    var dict:[String:Any] {
        return [
            "uid": uid,
            "name": name,
            "email": email,
            "playListIds": playListIds as NSArray,
            "followers": followers as NSArray,
            "photoUrl": ""
        ]
    }
}
