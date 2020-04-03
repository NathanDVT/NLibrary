//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public protocol SearchSongsViewModelProtocol: class {
    init (view: SeearchMusicTableViewControllerProtocol, repo: SearchSongRepoProtocol)
    func getCollections(artistName: String)
    func successfulRequest(songs: [SearchSongModel])
    func unsuccessfulRequest(errorMessage: String)
    func getSongs() -> [SearchSongDetail]
    func successfulUserPlaylistNames(playlistNames: [String])
    func getUserPlaylistNames()
    func addSongToPlaylist(playlistName: String, songIndex: Int)
    func addToRecentSongs(songIndex: Int)
}
