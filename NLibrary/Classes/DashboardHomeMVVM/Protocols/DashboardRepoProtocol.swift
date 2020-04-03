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
//    func getFollowers()
    func setViewModel(viewModel: DashboardViewModelProtocol)
    func getDashboardContent()
    func successFulNameRequest(dictionary: NSDictionary)
    func successFulRecentPlaylistRequest(dictionary: NSDictionary)
    func setServiceProvider(service: FirebaseServiceProtocol)
    func logoutRequest()
    func successfulLogOut()
}
