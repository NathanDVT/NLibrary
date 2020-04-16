//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public struct RecentSong {
    public var artistName: String = "N/A"
    public var titleName: String = "N/A"
    public var previewUrl: String = "N/A"
    init (model: RecentSongModel) {
        self.artistName = model.artistName
        self.titleName = model.titleName
        self.previewUrl = model.previewUrl
    }
    init () {
    }
}
