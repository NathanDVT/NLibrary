//
//  ArtistMediaViewModel.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/04.
//

import Foundation

public class ArtistMediaViewModel {
    
//    public var results: [ArtistMediaViewModelCollection]
//        required public init( ) {
//            results = []
//        }
//    }
//
//    public struct ArtistMediaViewModelCollection: Decodable {
//        public var artistName: String
//        public var collectionName: String
//        public var releaseDate: String
//        public var artworkUrl30: String
//        public var collectionPrice: Double
//        public var trackTimeMillis: Int
//        public var artworkUrl60: String
//        public var previewUrl: String
//        public init( ) {
//            artistName = ""
//            collectionName = ""
//            releaseDate = ""
//            artworkUrl30 = ""
//            artworkUrl60 = ""
//            previewUrl = ""
//            trackTimeMillis = 0
//            collectionPrice = 0
//        }
//    }

    public var listOfArtistCollections = [Collection]()
    public var artistName: String
    public init (artistName: String) {
        self.artistName = artistName
    }

    public func getCollections(completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        do {
            let artistMediaRequest = try ArtistMediaRepo(artistName: self.artistName)
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
