//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public struct DashBoardUserInfoModel {
    var name: String
}

public struct RecentListModel {
    var songs: [RecentSongModel]
}

public struct FollowersNumModel {
    var numFollowers: Int
}
