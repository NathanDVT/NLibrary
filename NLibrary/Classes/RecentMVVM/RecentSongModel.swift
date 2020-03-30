//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public struct RecentSongModel: DictionaryConvertible {

    var artistName: String = "N/A"
    var titleName: String = "N/A"
    var previewUrl: String = "N/A"
    
    var dict: [String: Any] {
        return [
            "artistName": artistName,
            "titleName": titleName,
            "previewUrl": previewUrl
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
    
    init(dictionary: NSDictionary) {
        /*
         TO DO: add functionality to receive objects from Firebase Database reference
         snapshotsguard let userID = dict["userID"] as? String, email = dict["email"]
         as? String, creationDate = dict["creationDate"] as? String else { return nil
            }
         */
        artistName = dictionary.value(forKey: "artistName") as! String
        titleName = dictionary.value(forKey: "titleName") as! String
        previewUrl = dictionary.value(forKey: "previewUrl") as! String
//        self.init()
    }
}
