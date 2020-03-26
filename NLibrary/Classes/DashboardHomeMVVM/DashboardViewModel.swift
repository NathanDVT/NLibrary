//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
struct RecentSong {
    var artistName: String
    var title: String
    var previewUrl: String
}

class DashboardViewModel: DashboardViewModelProtocol {

    var userName: String = ""
    var userId: String = ""
    var recentPlayedList: [RecentSong] = []
    var numFollowers: [String] = []
    var currentPlayingIndex: Int = 0

    required init(userId: String, viewController: SignUpViewControllerProtocol, userRepo: SignUpRepoProtocol) {

    }

    func playRecentSongAt(index: Int) {

    }

    func pauseCurrentSong() {

    }

    func populateView() {

    }

    func populateRecentSongs() {

    }

    func populateUsername() {

    }

    func populateNumFollowers() {

    }
}
