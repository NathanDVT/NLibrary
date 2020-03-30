//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

public protocol DashboardViewModelProtocol: class {
    init(viewController: DashboardViewControllerProtocol, repo: DashboardRepoProtocol)
    func playRecentSongAt(index: Int)
    func pauseOrPlayCurrentSong()
    func loadContent()
    func successFulNameReceived(userDashboardModel: DashBoardUserInfoModel)
    func successFulRecentSongsReceived(songsModel: [RecentSongModel])
}

public protocol DashboardRepoProtocol: class {
    init ()
    func getUserModel()
    func getRecent()
    func getFollowers()
    func setViewModel(viewModel: DashboardViewModelProtocol)
    func getDashboardContent()
    func successFulNameRequest(dictionary: NSDictionary)
    func successFulRecentPlaylistRequest(dictionary: NSDictionary)
}

public protocol DashboardViewControllerProtocol: class {
    func successFulNameRequest(name: String)
    func successFulSongRequests(songs: [RecentSong])
    func setSongTitle(title: String)
    func setCurrentControlIcon(img: UIImage)
}
