//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class DashboardRepo: DashboardRepoProtocol {
    lazy var firebaseService: FirebaseService = {return FirebaseService(repo: self)}()
    var viewModel: DashboardViewModelProtocol?
    public required init () {

    }
    public func getUserModel() {

    }
    public func getRecent() {

    }
    public func getFollowers() {

    }
    public func setViewModel(viewModel: DashboardViewModelProtocol) {
        self.viewModel = viewModel
    }
    public func getDashboardContent() {
        self.firebaseService.getDashboardItems()
    }
    public func successFulNameRequest(dictionary: NSDictionary) {
        guard let name = dictionary["name"] as? String else {
            return
        }
        let user: DashBoardUserInfoModel = DashBoardUserInfoModel(name: name)
        viewModel!.successFulNameReceived(userDashboardModel: user)
    }
    public func successFulRecentPlaylistRequest(dictionary: NSDictionary) {
        var recentSongModels: [RecentSongModel] = []
        for (_, value) in dictionary {
            guard let page = value as? NSDictionary else {
                return
            }
            recentSongModels.append(RecentSongModel(dictionary: page))
        }
        viewModel?.successFulRecentSongsReceived(songsModel: recentSongModels)
    }
}
