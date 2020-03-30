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
    public func setViewModel(viewModel: DashboardViewModelProtocol){
        self.viewModel = viewModel
    }
    public func getDashboardContent() {
        self.firebaseService.getDashboardItems()
    }
    public func successFulNameRequest(dictionary: NSDictionary) {
        let user: DashBoardUserInfoModel = DashBoardUserInfoModel(name: dictionary["name"] as! String)
        viewModel!.successFulNameReceived(userDashboardModel: user)
    }
    public func successFulRecentPlaylistRequest(dictionary: NSDictionary) {
        var recentSongModels: [RecentSongModel] = []
        for (_, value) in dictionary {
            recentSongModels.append(RecentSongModel(dictionary: value as! NSDictionary))
        }
        viewModel?.successFulRecentSongsReceived(songsModel: recentSongModels)
    }
}
