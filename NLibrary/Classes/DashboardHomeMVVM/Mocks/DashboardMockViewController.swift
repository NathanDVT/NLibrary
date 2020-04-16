//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

@available(iOS 13.0, *)
public class DashboardMockViewController: DashboardViewControllerProtocol {
    public func successfulTrendingArtists(trendingArtists: [TrendingArtistModel]) {
        
    }
    
    public func successfulLogout() {

    }

    public func successFulNameRequest(name: String) {

    }
    public func successFulSongRequests(songs: [RecentSong]) {

    }
    public func setSongTitle(title: String) {

    }
    public func setCurrentControlIcon(img: UIImage) {

    }
}
