//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public struct PlaylistBasicModel {
    public var playlistItems: [PlaylistItemBasicModel] = []
    public var authorId: String?
    init?(dict: NSDictionary) {
        guard let keyValues = dict.allValues.first as? NSDictionary else {
            return
        }
        guard let authorId = dict.allKeys.first as? String else {
            return
        }
        self.authorId = authorId
        for (key, value) in keyValues {
            guard let key = key as? String,
                let page = value as? NSDictionary else {
                return
            }
            playlistItems.append(PlaylistItemBasicModel(albumName: key, dictionary: page))
        }
    }
    
    var dict: [String : Any]?
}

public struct PlaylistItemBasicModel: DictionaryConvertible {
    public var id: String = ""
    public var name: String = ""
    public var numSongs: Int = 0
    public var basicSongItems: [BasicSongItem] = []
    public var dict: [String: Any] {
        return [
            "name": name,
            "numSongs": numSongs
        ]
    }

    init() {
    }

    init?(dict: [String: Any]) {
        self.init()
    }

    init(albumName: String, dictionary: NSDictionary) {
        name = albumName
        let numSongs = dictionary.allValues.count
        self.numSongs = numSongs
        guard let songId = dictionary.allKeys.first as? String else {
            return
        }
        for page in dictionary.allValues {
            let page = page as! [String: Any]
            basicSongItems.append(BasicSongItem(songId: songId, dictionary: page))
        }
        
    }
}

public struct BasicSongItem: Decodable {
    public var artistName: String = ""
//    public var trackTimeMillis: Int
//    public var artworkUrl60: String
    public var songTitle: String = ""
    public var previewUrl: String = ""
    public var songId: String = ""

    public init(songId: String, dictionary: [String: Any] ) {
        let artistName = dictionary["artistName"] as! String
        let previewUrl = dictionary["previewUrl"] as! String
        let songTitle = dictionary["titleName"] as! String
        self.artistName = artistName
        self.previewUrl = previewUrl
        self.songId = songId
        self.songTitle = songTitle
    }
}
