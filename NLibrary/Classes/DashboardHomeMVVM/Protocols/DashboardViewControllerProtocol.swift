//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public protocol DashboardViewControllerProtocol: class {
    func successFulSongRequests(songs: [RecentSong])
    func successfulTrendingArtists(trendingArtists: [TrendingArtistModel])
}
