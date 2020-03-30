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
    func getUserModel()
    func getRecent()
    func getFollowers()
    func setViewModel(viewModel: DashboardViewModelProtocol)
    func getDashboardContent()
    func successFulNameRequest(dictionary: NSDictionary)
    func successFulRecentPlaylistRequest(dictionary: NSDictionary)
}
