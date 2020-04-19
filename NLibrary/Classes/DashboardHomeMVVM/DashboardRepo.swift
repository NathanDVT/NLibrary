//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class DashboardRepo: DashboardRepoProtocol {
    lazy var firebaseService: FirebaseServiceProtocol = {return FirebaseService(repo: self)}()
    lazy var nlibraryService: NLibrarySerivce = {return NLibrarySerivce()}()
    var viewModel: DashboardViewModelProtocol?
    public required init () {

    }
    public func setViewModel(viewModel: DashboardViewModelProtocol) {
        self.viewModel = viewModel
    }
    public func getDashboardContent() {
        self.firebaseService.getDashboardItems()
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
    public func setServiceProvider(service: FirebaseServiceProtocol) {
        self.firebaseService = service
    }
    public func logoutRequest() {
        self.firebaseService.logout()
    }
    public func successfulLogOut() {
        self.viewModel?.successfulLogOut()
    }

    private var repo: TrendingArtistRepo?
    public required init (view: UIViewController, repo: TrendingArtistRepo) {
        self.repo = repo
    }

    public func getTrending(completion: @escaping (Result<[TrendingArtistModel], Error>) -> Void) {
        try? self.nlibraryService.getTrending() { handler in
            switch (handler) {
            case .success(let jsonData):
                let trendingArtistModels: [TrendingArtistModel] =
                try! JSONDecoder().decode([TrendingArtistModel].self, from: jsonData)
                completion(.success(trendingArtistModels))
            default:
                completion(.failure(ArtistMediaError.canNotProcessData))
            }
        }
    }

    public func postTrending(trendingArtists: TrendingArtistModel,
                             completion: @escaping (Result<Bool, Error>) -> Void) {
        try? self.nlibraryService.postTrending(trendingArtist: trendingArtists) { handler in
             switch (handler) {
             case .success( _):
                 completion(.success(true))
             default:
                 completion(.failure(ArtistMediaError.canNotProcessData))
             }
         }
    }
}
