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
    func logoutRequest()
    func successfulLogOut()
}
