//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public class PlaylistRepo {
    var viewModel: PlaylistViewModel?
    lazy var firebaseService: FirebaseService = {return FirebaseService(repo: self)}()

    public init() {

    }

    public func addSongToRecent(songDTO: RecentSongModel) {
    }

    public func setViewModel(viewModel: PlaylistViewModel) {
        self.viewModel = viewModel
    }
    
    public func getUserPlaylistDetails() {
        firebaseService.getUserPlaylistDetails()
    }

    public func successfulGetUserPlaylists(dictionary: NSDictionary) {
        var recentSongModels: [PlaylistDetailModel] = []
        guard let keyValues = dictionary.allValues.first as? [String: Any] else {
            return
        }
        for (key, value) in keyValues {
            guard let songsDictionary = value as? [String: Any] else { return }
            recentSongModels.append(PlaylistDetailModel(name: key, numSongs: songsDictionary.count))
        }
        viewModel?.successfulRequest(songs: recentSongModels)
    }

    public func createPlaylist(playlistName: String) {
        firebaseService.createPlaylist(playlistName: playlistName)
    }
}

