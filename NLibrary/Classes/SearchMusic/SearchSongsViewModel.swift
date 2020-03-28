//
//  ArtistMediaViewModel.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/04.
//

import Foundation
public class SearchSongsViewModel: NSObject {
    public var results: [ArtistMediaViewModelCollection]
    @objc public var hii: String = ""
    public struct ArtistMediaViewModelCollection: Decodable {
        public var artistName: String
        public var collectionName: String
        public var releaseDate: String
        public var artworkUrl30: String
        public var collectionPrice: Double
        public var trackTimeHours: Int
        public var trackTimeMinutes: Int
        public var artworkUrl60: String
        public var previewUrl: String

        public init(collection: Collection ) {
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

    public var listOfArtistCollections = [Collection]()
    public var artistName: String
    public init (artistName: String) {//, repo: ArtistMediaRepoProtocol) {
        self.artistName = artistName
        self.results = []
    }

    public func getCollections(completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        do {
            let artistMediaRequest = try SearchSongRepo(artistName: self.artistName)
            artistMediaRequest.getArtistMedia { /*[weak self]*/ result in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let collections):
                    completion(.success(collections))
                }
            }
        } catch {}
    }
}
