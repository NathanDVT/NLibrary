//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

extension String {
    func toJSONArray() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

public struct TrendingArtistModel: Codable {

    public var artistName: String = ""
    public var tally: Int = 0

    init(name: String, tally: Int) {
        self.artistName = name
        self.tally = tally
    }
    
    init () {
    }
    
//    public init (jsonData: String) {
//        self.jsonData = jsonData
//    }

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
        guard let arName = dictionary.value(forKey: "artistName") as? String,
        let tally = dictionary.value(forKey: "tally") as? Int else {
            return
        }

        artistName = arName
        self.tally = tally
    }
}

public class List: Codable {
    var list: [TrendingArtistModel] = []
}

