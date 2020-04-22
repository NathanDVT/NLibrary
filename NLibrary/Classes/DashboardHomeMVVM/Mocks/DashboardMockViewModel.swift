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
public class DashboardMockViewModel: DashboardViewModelProtocol {
    public func postTrendingSong(index: Int) {

    }
    
    public func getTrending() {
    }
    
    public func logoutRequest() {
    }

    public func successfulLogOut() {

    }

    public var userName: String = ""
    public var testRecentSongModels: [RecentSongModel] = []
    var recentPlayedList: [RecentSong] = []
    var numFollowers: [String] = []
    var currentPlayingIndex: Int = -1
    private var repo: DashboardRepoProtocol?
    weak var viewController: DashboardViewControllerProtocol?
    lazy var musicPlayer: AVPlayer = {return AVPlayer()}()

    required public init(viewController: DashboardViewControllerProtocol,
                         repo: DashboardRepoProtocol) {
        self.repo = repo
        self.viewController = viewController
        self.repo?.setViewModel(viewModel: self)
    }

    public func loadContent() {
    }

    public func playRecentSongAt(index: Int) {

    }

    public func pauseOrPlayCurrentSong() {

    }

    public func successFulRecentSongsReceived(songsModel: [RecentSongModel]) {
        testRecentSongModels = songsModel
    }
}
