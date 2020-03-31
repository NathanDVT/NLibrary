//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public class PlaylistViewModel {
    private var results: [SearchSongDetail]
    private var repo: PlaylistRepo?
    weak var viewController: PlaylistViewControllerProtocol?

    public var listOfArtistCollections = [SearchSongModel]()
    public required init (view: PlaylistViewControllerProtocol, repo: PlaylistRepo) {
        self.results = []
        self.repo = repo
        self.viewController = view
        repo.setViewModel(viewModel: self)
    }

    public func requestUserPlaylistDetails() {
        repo?.getUserPlaylistDetails()
    }
    public func unsuccessfulRequest(errorMessage: String) {
    }

    public func successfulRequest(songs: [PlaylistDetailModel]) {
        self.viewController?.successfulRequest(songs: songs)
    }

    private func convertToViewModel(songs: [SearchSongModel]) {
        results.removeAll()
        for song in songs {
            results.append(SearchSongDetail(collection: song))
        }
    }

    public func getSongs() -> [SearchSongDetail] {
        return results
    }
    
    public func createPlaylist(playlistName: String) {
        repo?.createPlaylist(playlistName: playlistName)
    }

//    public func addToRecentSongs(songIndex: Int) {
//        var recentSong: RecentSongModel = RecentSongModel()
//        let selectedSong: SearchSongDetail = results[songIndex]
//        recentSong.artistName = selectedSong.artistName
//        recentSong.previewUrl = selectedSong.previewUrl
//        recentSong.titleName = selectedSong.titleName
//        repo?.addSongToRecent(songDTO: recentSong)
//    }
}
