//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit


public protocol ProfileRepoProtocol: class {
    init ()
    func getUserProfile(completion: @escaping(Result<ProfileModel, APIFailureResult>) -> Void)
    func logoutRequest(completion: @escaping(APIRequestResult) -> Void)
}
