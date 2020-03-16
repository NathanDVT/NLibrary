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
        guard let jsonUrl = Bundle.main.url(forResource: "repoResponse1", withExtension: "json"),
                let data = try? Data(contentsOf: jsonUrl),
                let library = try? JSONDecoder().decode(ArtistMediaResponse.self, from: data) else {
                    fatalError("Could not load repoResponse1.json")
            }
    }
}
