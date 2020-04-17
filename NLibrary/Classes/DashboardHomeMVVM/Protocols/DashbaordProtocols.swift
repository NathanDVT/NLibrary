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
//TO DO: Refactor to profile board    func successFulNameReceived(userDashboardModel: DashBoardUserInfoModel)
    func successFulRecentSongsReceived(songsModel: [RecentSongModel])
    func logoutRequest()
    func successfulLogOut()
    func getTrending()
    func postTrendingSong(index: Int)
}
