//
//  ArtistMediaViewModel.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/04.
//

import Foundation

public class ArtistMediaViewModel {
    public var listOfArtistCollections = [Collection]()
    public var artistName : String
    public init (artistName: String)
    {
        self.artistName = artistName
    }
    
    public func getCollections(completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        let artistMediaRequest = ArtistMediaRequest(artistName: self.artistName)
        artistMediaRequest.getArtistMedia { [weak self] result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let collections):
                completion(.success(collections))
            }
        }
    }
}
