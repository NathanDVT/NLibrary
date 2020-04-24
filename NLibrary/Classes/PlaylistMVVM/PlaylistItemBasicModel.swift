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
        guard let keyValues = dict.allValues.first as? NSDictionary,
            let authorId = dict.allKeys.first as? String else {
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
    var dict: [String: Any]?
}

public struct PlaylistItemBasicModel {
    public var listid: String = ""
    public var name: String = ""
    public var numSongs: Int = 0
    public var basicSongItems: [BasicSongItem] = []
    public var dict: [String: Any] {
        return [
            "name": name,
            "numSongs": numSongs
        ]
    }

    init(albumName: String, dictionary: NSDictionary) {
        name = albumName
        let numSongs = dictionary.allValues.count
        self.numSongs = numSongs
        guard let songId = dictionary.allKeys.first as? String else {
            return
        }
        for page in dictionary.allValues {
            guard let page = page as? [String: Any] else {
                return
            }
            basicSongItems.append(BasicSongItem(songId: songId, dictionary: page))
        }
    }
}

public struct BasicSongItem: Decodable {
    public var artistName: String = ""
// TO DO   public var trackTimeMillis: Int
// TO DO   public var artworkUrl60: String
    public var songTitle: String = ""
    public var previewUrl: String = ""
    public var songId: String = ""

    public init(songId: String, dictionary: [String: Any] ) {
        guard let artistName = dictionary["artistName"] as? String,
            let previewUrl = dictionary["previewUrl"] as? String,
            let songTitle = dictionary["titleName"] as? String else {
                return
        }
        self.artistName = artistName
        self.previewUrl = previewUrl
        self.songId = songId
        self.songTitle = songTitle
    }
}
