//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

//public protocol SearchSongRepoProtocol: class {
//    func getArtistMedia (artistName: String) throws
//    func successfulRequest(jsonData: Data?)
//    func setViewModel(viewModel: SearchSongsViewModelProtocol)
//}

public protocol RecentRepoProtocol: class {
    func getRecentSongs(uid: String)
    func successfulRequest(jsonData: Data?)
    func unsuccessfulSongRequests()
    func setViewModel(viewModel: RecentViewModelProtocol)
    func postRecentSongs()
}


public class RecentRepo: RecentRepoProtocol{
    public init() {

    }
    public func getRecentSongs(uid: String) {
        
    }
    
    public func postRecentSongs() {
        
    }
    
    public func successfulRequest(jsonData: Data?) {
        
    }
    
    public func unsuccessfulSongRequests() {
        
    }
    
    public func setViewModel(viewModel: RecentViewModelProtocol) {
        
    }
}
