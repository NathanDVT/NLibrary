//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class SearchSongRepo: SearchSongRepoProtocol {
    
    let resourceURL: URL

    public init(artistName: String) throws {
        let resourceString = "https://itunes.apple.com/search?term=\(artistName)"
        guard let resourceURL = URL(string: resourceString)
            else { throw ArtistMediaError.invalidName}
        self.resourceURL = resourceURL
    }

    public func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: self.resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let artistMediaResponse = try decoder.decode(ArtistMediaResponse.self, from: jsonData)
                let collections = artistMediaResponse.results
                completion(.success(collections))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
