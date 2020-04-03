//
//  ArtistMediaViewModel.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/04.
//

import Foundation
public class SearchSongsViewModel: SearchSongsViewModelProtocol {
    public func addSongToPlaylist(playlistName: String, songIndex: Int) {
        var recentSong: RecentSongModel = RecentSongModel()
        let selectedSong: SearchSongDetail = results[songIndex]
        recentSong.artistName = selectedSong.artistName
        recentSong.previewUrl = selectedSong.previewUrl
        recentSong.titleName = selectedSong.titleName
        repo?.addSongToPlaylist(playlistName: playlistName, songDTO: recentSong)
    }

    public func getUserPlaylistNames() {
        self.repo?.getUserPlaylistNames()
    }

    public func successfulUserPlaylistNames(playlistNames: [String]) {
        viewController?.successFulRecentSongsReceived(playlistNames: playlistNames)
    }

    public func addSongToPlaylist() {

    }

    private var results: [SearchSongDetail]
    private var playlistNames: [String] = []
    private var repo: SearchSongRepoProtocol?
    weak var viewController: SeearchMusicTableViewControllerProtocol?

    public var listOfArtistCollections = [SearchSongModel]()
    public required init (view: SeearchMusicTableViewControllerProtocol, repo: SearchSongRepoProtocol) {
        self.results = []
        self.repo = repo
        self.viewController = view
        repo.setViewModel(viewModel: self)
    }

    public func successFulRecentSongsReceived(playlistNames: [String]) {
        viewController?.successFulRecentSongsReceived(playlistNames: playlistNames)
    }

    public func unsuccessfulRequest(errorMessage: String) {
        self.viewController?.unsuccessfulRequest(errorMessage: errorMessage)
    }

    public func getCollections(artistName: String) {
        do {
            try repo?.getArtistMedia(artistName: artistName)
        } catch {}
    }

    public func successfulRequest(songs: [SearchSongModel]) {
        results.removeAll()
        for song in songs {
            results.append(SearchSongDetail(collection: song))
        }
        self.viewController?.successfulRequest()
    }

    public func getSongs() -> [SearchSongDetail] {
        return results
    }

    public func addToRecentSongs(songIndex: Int) {
        var recentSong: RecentSongModel = RecentSongModel()
        let selectedSong: SearchSongDetail = results[songIndex]
        recentSong.artistName = selectedSong.artistName
        recentSong.previewUrl = selectedSong.previewUrl
        recentSong.titleName = selectedSong.titleName
        repo?.addSongToRecent(songDTO: recentSong)
    }
}

public struct SearchSongDetail: Decodable {
    public var artistName: String
    public var collectionName: String
    public var trackTimeHours: Int
    public var trackTimeMinutes: Int
    public var artworkUrl60: String
    public var previewUrl: String
    public var titleName: String

    public init( collection: SearchSongModel ) {
        self.artistName = collection.artistName
        self.collectionName = collection.collectionName
        self.trackTimeHours = collection.trackTimeMillis / (60*60)
        self.trackTimeMinutes = collection.trackTimeMillis - (60) / collection.trackTimeMillis
        self.artworkUrl60 = collection.artworkUrl60
        self.previewUrl = collection.previewUrl
        self.titleName = collection.trackName
        }
}
