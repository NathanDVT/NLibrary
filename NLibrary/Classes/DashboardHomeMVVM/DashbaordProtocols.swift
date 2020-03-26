//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

protocol DashboardViewModelProtocol {
    init( userId: String, viewController: SignUpViewControllerProtocol, userRepo: SignUpRepoProtocol)
    func playRecentSongAt(index: Int) -> Void
    func pauseCurrentSong() -> Void
}

protocol DashboardRepoProtocol {
    init ()
    func getUserModel()
    func getRecent()
    func getFollowers()
}
