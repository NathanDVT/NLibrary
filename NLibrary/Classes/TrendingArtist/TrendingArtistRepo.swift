//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public class TrendingArtistRepo {
    var nservice: NLibrarySerivce?
    
    init() {
        nservice = NLibrarySerivce()
    }

    public func getTrending(completion: @escaping (Result<Data, Error>) -> Void) {
        try? self.nservice?.getTrending() { handler in
            switch (handler) {
            case .success(let jsonData):
                
                var trendingArtistModels: [TrendingArtistModel] =
                try! JSONDecoder().decode([TrendingArtistModel].self, from: jsonData)
            default:
                break
            }
        }
    }
}
