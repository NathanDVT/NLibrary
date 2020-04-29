//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

public protocol SearchViewControllerProtocol: class {
    func successfulRequest()
    func unsuccessfulRequest(errorMessage: String)
    func successFulRecentSongsReceived(playlistNames: [String])
}
