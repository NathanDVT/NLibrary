//
//  ArtistMediaViewModel.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/02.
//

import Foundation

// ViewModel --------------------------------------------

public struct ArtistMediaResponseViewModel: Decodable {
    public var results: [CollectionViewModel]?
    public init( artistName: String ){
        let model = ArtistMediaRequest(artistName: artistName)
        results = nil
//        results = convertToViewModel(collectionModels: model.)
//        print(results)
    }
}

private func convertToViewModel(collectionModels: [Collection]) -> [CollectionViewModel] {
    var toReturn = [CollectionViewModel]()
    for collectionModel in collectionModels {
        toReturn.append(CollectionViewModel())
    }
    return toReturn
}

public struct CollectionViewModel: Decodable {
    public var artistName: String
    public var collectionName: String
    public var releaseDate: String
    public var artworkUrl30: String
    public var collectionPrice: Double
    public var trackTimeMillis: Int
    public var artworkUrl60: String
    public var previewUrl: String
    
    public init(){
        artistName = "Blank"
        collectionName = ""
        releaseDate = ""
        artworkUrl30 = ""
        artworkUrl60 = ""
        previewUrl = ""
        trackTimeMillis = 0
        collectionPrice = 0
    }
}
