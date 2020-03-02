//
//  ArtistMed.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/02.
//

import Foundation

public struct ArtistMediaResponse: Decodable {
    public var results: [Collection]
    public init(){
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
    public init(){
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
