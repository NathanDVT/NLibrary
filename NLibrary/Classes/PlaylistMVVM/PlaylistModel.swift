//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public struct PlaylistModel {
    public var playlistId: String = ""
    public var playlistName: String = ""
    public var producerEmail: String = ""
    public var producerId: String = ""
    public var numSongs: Int = 0
    public var basicSongItems: [BasicSongItem] = []
    
    init(dictionary: NSDictionary) {
        guard let dictionary = dictionary.allValues.first as? [String: Any],
            let playlistId = dictionary["playlistId"] as? String,
            let playlistName = dictionary["playlistName"] as? String,
            let producerEmail = dictionary["producerEmail"] as? String,
            let producerId = dictionary["producerId"] as? String,
            let songsDict = dictionary["songs"] as? [String: Any] else {
                return
        }
        for entry in songsDict {
            guard let songDict = entry.value as? [String: Any] else {
                return
            }
            basicSongItems.append(BasicSongItem(dictionary: songDict))
        }
        self.playlistId = playlistId
        self.playlistName = playlistName
        self.producerEmail = producerEmail
        self.producerId = producerId
        self.numSongs = basicSongItems.count
    }
}

public struct BasicSongItem: Decodable {
    public var artistName: String = ""
// TO DO   public var trackTimeMillis: Int
    public var artworkUrl60: String = ""
    public var songTitle: String = ""
    public var previewUrl: String = ""
    public var songId: String = ""

    public init(dictionary: [String: Any] ) {
        guard let artistName = dictionary["artistName"] as? String,
            let previewUrl = dictionary["previewUrl"] as? String,
            let artworkUrl60 = dictionary["artworkUrl60"] as? String,
            let songTitle = dictionary["titleName"] as? String else {
                return
        }
        self.artistName = artistName
        self.previewUrl = previewUrl
        self.songTitle = songTitle
        self.artworkUrl60 = artworkUrl60
    }
}
