//
//  ArtistMedia.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/02.
//

import Foundation
// Mocks
public protocol ArtistMediaResponseProtocol: class {
    init( ) throws
    var results: [Collection] {get set}
}

public protocol SearchSongRepoProtocol: class {
    //init(artistName: String)
    func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void)
}

// DTO: Data Transfer Objects

public class ArtistMediaResponse: Decodable, ArtistMediaResponseProtocol {
    public var results: [Collection]
    required public init( ) {
        results = []
    }
}

public struct Collection: Decodable {
    public var artistName: String
    public var collectionName: String
    public var releaseDate: String
    public var artworkUrl30: String
    public var collectionPrice: Double
    public var trackTimeMillis: Int
    public var artworkUrl60: String
    public var previewUrl: String
    public init( ) {
        artistName = ""
        collectionName = ""
        releaseDate = ""
        artworkUrl30 = ""
        artworkUrl60 = ""
        previewUrl = ""
        trackTimeMillis = 0
        collectionPrice = 0
    }
}

public enum ArtistMediaError: Error {
    case noDataAvailable
    case canNotProcessData
    case invalidName
}

//////////////////////// Repository

//public class ArtistMediaRepo: ArtistMediaRepoProtocol {
//    let resourceURL: URL
//
//    public init(artistName: String) throws {
//        let resourceString = "https://itunes.apple.com/search?term=\(artistName)"
//        guard let resourceURL = URL(string: resourceString)
//            else { throw ArtistMediaError.invalidName}
//        self.resourceURL = resourceURL
//    }
//
//    public func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
//        let dataTask = URLSession.shared.dataTask(with: self.resourceURL) { data, _, _ in
//            guard let jsonData = data else {
//                completion(.failure(.noDataAvailable))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let artistMediaResponse = try decoder.decode(ArtistMediaResponse.self, from: jsonData)
//                let collections = artistMediaResponse.results
//                completion(.success(collections))
//            } catch {
//                completion(.failure(.canNotProcessData))
//            }
//        }
//        dataTask.resume()
//    }
//}
