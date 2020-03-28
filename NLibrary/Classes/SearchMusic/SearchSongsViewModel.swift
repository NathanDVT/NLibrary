//
//  ArtistMediaViewModel.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/04.
//

import Foundation
public class SearchSongsViewModel: SearchSongsViewModelProtocol {

    private var results: [SearchSongDetail]
    private var repo: SearchSongRepoProtocol?
    weak var viewController: SeearchMusicTableViewControllerProtocol?

    public var listOfArtistCollections = [SearchSongModel]()
    public required init (view: SeearchMusicTableViewControllerProtocol, repo: SearchSongRepoProtocol) {
        self.results = []
        self.repo = repo
        self.viewController = view
        repo.setViewModel(viewModel: self)
    }

    public func unsuccessfulRequest(errorMessage: String) {
        self.viewController?.unsuccessfulRequest(errorMessage: errorMessage)
    }

    public func getCollections(artistName: String) {
        do {
            let artistMediaRequest = SearchSongRepo()
            try artistMediaRequest.getArtistMedia(artistName: artistName) 
        } catch {}
    }
    
    public func successfulRequest(songs: [SearchSongModel]) {
        self.viewController?.successfulRequest()
    }
    
    public func getSongs() -> [SearchSongDetail] {
        return results
    }
}

public struct SearchSongDetail: Decodable {
    public var artistName: String
    public var collectionName: String
    public var releaseDate: String
    public var artworkUrl30: String
    public var collectionPrice: Double
    public var trackTimeHours: Int
    public var trackTimeMinutes: Int
    public var artworkUrl60: String
    public var previewUrl: String

    public init( collection: SearchSongModel ) {
        self.artistName = collection.artistName
        self.collectionPrice = collection.collectionPrice
        self.releaseDate = collection.releaseDate
        self.artworkUrl30 = collection.artworkUrl30
        self.collectionName = collection.collectionName
        self.trackTimeHours = collection.trackTimeMillis / (60*60)
        self.trackTimeMinutes = collection.trackTimeMillis - (60) / collection.trackTimeMillis
        self.artworkUrl60 = collection.artworkUrl60
        self.previewUrl = collection.previewUrl
        self.collectionPrice = collection.collectionPrice
        self.releaseDate = collection.releaseDate
        }
}
