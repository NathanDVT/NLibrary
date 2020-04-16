//
//  ArtistMedia.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/02.
//

import Foundation
// Mocks
public protocol ArtistMediaResponseProtocol: class {
    var results: [SearchSongModel] {get set}
}
// DTO: Data Transfer Objects

public class ArtistMediaResponse: Decodable, ArtistMediaResponseProtocol {
    public var results: [SearchSongModel]
    required public init( ) {
        results = []
    }
}

public struct SearchSongModel: Decodable {
    public var artistName: String
    public var collectionName: String
    public var releaseDate: String
    public var artworkUrl30: String
    public var collectionPrice: Double
    public var trackTimeMillis: Int
    public var artworkUrl60: String
    public var previewUrl: String
    public var trackName: String

    public init( ) {
        artistName = ""
        collectionName = ""
        releaseDate = ""
        artworkUrl30 = ""
        artworkUrl60 = ""
        previewUrl = ""
        trackName = ""
        trackTimeMillis = 0
        collectionPrice = 0
    }
}
