//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

class SingleSongViewModel {
    var artistName: String
    var title: String
    var artworkUrl30: String
    var previewUrl: String

    init(model: SingleModel) {
        self.artistName = model.artistName
        self.title = model.title
        self.artworkUrl30 = model.artworkUrl30
        self.previewUrl = model.previewUrl
    }
}
