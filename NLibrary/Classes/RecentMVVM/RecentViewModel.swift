//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public protocol RecentViewModelProtocol: class {
    init (view: RecentViewControllerProtocol, repo: RecentRepoProtocol)
    func addToRecentSongs(userId: String)
    func successfulRequest(songs: [SearchSongModel])
    func unsuccessfulRequest(errorMessage: String)
}

public class RecentViewModel: RecentViewModelProtocol {
//    private var songs: [RecentSongModel]
    private var repo: RecentRepoProtocol?
    private var currentSong: RecentSongModel?
    weak var viewController: RecentViewControllerProtocol?
    
    required public init (view: RecentViewControllerProtocol, repo: RecentRepoProtocol) {
//        self.songs = []
        self.repo = repo
        self.viewController = view
        repo.setViewModel(viewModel: self)
    }
    public func addToRecentSongs(userId: String) {

    }
    public func successfulRequest(songs: [SearchSongModel]) {

    }
    public func unsuccessfulRequest(errorMessage: String) {

    }
}
