//
//  ArtistMediaModelMock.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/09.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class ArtistMediaRepoMock: SearchSongRepoProtocol {
    public func addSongToPlaylist(playlistName: String, songDTO: RecentSongModel) {

    }

    public func successfulUserPlaylistNames(dictionary: NSDictionary) {

    }

    public func getUserPlaylistNames() {

    }

    public func successfulUserPlaylist(dictionary: NSDictionary) {

    }

    public func addSongToRecent(songDTO: RecentSongModel) {

    }

    public func successfulRequest(jsonData: Data?) {

    }

    public func getArtistMedia(artistName: String) throws {

    }

    public func setViewModel(viewModel: SearchSongsViewModelProtocol) {

    }

    public required init() {

    }

    public func getArtistMedia(artistName: String,
                               completion: @escaping (Result<[SearchSongModel], ArtistMediaError>) -> Void) throws {
    }
}
