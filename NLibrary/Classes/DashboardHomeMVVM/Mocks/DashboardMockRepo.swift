//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class DashboardMockRepo: DashboardRepoProtocol {
    public func postTrending(trendingArtists: TrendingArtistModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    public func getTrending(completion: @escaping (Result<[TrendingArtistModel], Error>) -> Void) {
        
    }

    public func logoutRequest() {

    }

    public func successfulLogOut() {

    }

    lazy var firebaseService: FirebaseServiceProtocol = {return FirebaseService(repo: self)}()
    var viewModel: DashboardViewModelProtocol?
    public required init () {

    }
    public func setViewModel(viewModel: DashboardViewModelProtocol) {
    }
    public func getDashboardContent() {
    }
    public func successFulNameRequest(dictionary: NSDictionary) {
    }
    public func successFulRecentPlaylistRequest(dictionary: NSDictionary) {
    }

    public func setServiceProvider(service: FirebaseServiceProtocol) {
    }
}
