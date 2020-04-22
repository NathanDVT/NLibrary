//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public protocol DashboardRepoProtocol: class {
    init ()
    func setViewModel(viewModel: DashboardViewModelProtocol)
    func getDashboardContent()
//TO DO: Refactor to profile screen    func successFulNameRequest(dictionary: NSDictionary)
    func successFulRecentPlaylistRequest(dictionary: NSDictionary)
    func setServiceProvider(service: FirebaseServiceProtocol)
    func getTrending(completion: @escaping (Result<[TrendingArtistModel], Error>) -> Void)
    func postTrending(trendingArtists: TrendingArtistModel,
    completion: @escaping (Result<Bool, Error>) -> Void)
}
