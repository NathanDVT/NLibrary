//
//  ArtistMediaModelMock.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/09.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class ArtistMediaRepoMock: ArtistMediaRepoProtocol {
    public init(artistName: String) throws {

    }

    public func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        guard
            let path = Bundle.main.path(forResource: "repoResponse1", ofType: "json")
            else { fatalError("Can't find search.json file") }
        do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode( ArtistMediaResponse.self, from: data)
            completion(.success(response.results))
        } catch {}
    }
}
