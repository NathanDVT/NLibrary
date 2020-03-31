//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public struct PlaylistDetailModel: DictionaryConvertible {
    public var name: String = ""
    public var numSongs: Int = 0
    public var dict: [String: Any] {
        return [
            "name": name,
            "numSongs": numSongs
        ]
    }

    init() {
    }
    
    init(name: String, numSongs: Int) {
        self.name = name
        self.numSongs = numSongs
    }

    init?(dict: [String: Any]) {
        self.init()
    }

    init(dictionary: NSDictionary) {
        guard let name = dictionary.allKeys.first as? String else {
            return
        }
        let numSongs = dictionary.allValues.count
        self.name = name
        self.numSongs = numSongs
    }
}
