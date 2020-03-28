//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public protocol SearchSongRepoProtocol: class {
    func getArtistMedia (artistName: String) throws
    func successfulRequest(jsonData: Data?)
    func setViewModel(viewModel: SearchSongsViewModelProtocol)
}

public enum ArtistMediaError: Error {
    case noDataAvailable
    case canNotProcessData
    case invalidName
}

public class SearchSongRepo: SearchSongRepoProtocol {
    var viewModel: SearchSongsViewModelProtocol?
    lazy var nlibraryService: NLibrarySerivce = {
        return NLibrarySerivce(repo: self)
    }()
    
    public init() {
    }
//    self    NLibrary.SearchSongRepo    0x0000600001030ed0
    public func setViewModel(viewModel: SearchSongsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    public func successfulRequest(jsonData: Data?) {
        let decoder = JSONDecoder()
        guard let jsonData = jsonData else { return }
        do {
            let artistMediaResponse = try decoder.decode(ArtistMediaResponse.self, from: jsonData)
            self.viewModel!.successfulRequest(songs: artistMediaResponse.results)
        } catch {

        }
    }

    public func getArtistMedia (artistName: String) throws {
        do {
            try self.nlibraryService.getSongs(artistName: artistName)
        } catch {
            self.viewModel?.unsuccessfulRequest(errorMessage: "Unable to process artist name, please ensure no special characters are used")
        }
    }
}
