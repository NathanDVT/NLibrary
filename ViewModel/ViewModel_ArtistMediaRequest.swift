//
//  ViewModel_ArtistMediaRequest.swift
//  NLibrary
//
//  Created by Nathan Ngobale on 2020/03/02.
//

import Foundation

public enum ArtistMediaError: Error {
    case noDataAvailable
    case canNotProcessData
}

public struct ArtistMediaRequest {
    let resourceURL: URL

    public init(artistName: String) {
        let resourceString = "https://itunes.apple.com/search?term=\(artistName)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }

    public func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
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
