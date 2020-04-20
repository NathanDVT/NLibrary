//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public class ProfileMockRepo: ProfileRepoProtocol {
    var closurePathway: APIRequestResult = .succesfullRequest
    public required init () {
    }

    public func getUserProfile(completion: @escaping(Result<ProfileModel, APIFailureResult>) -> Void) {
        switch closurePathway {
        case .failedRequest(_):
            completion(.failure(.failedRequest(message: "failed getUserProfile")))
        case .succesfullRequest:
            let dictionary: NSDictionary = [
                "gender": Gender.male.stringValue,
                "name": "name",
                "email": "email",
                "Playlists": ["1":"x", "2": "x"]
            ]
            completion(.success(ProfileModel(dictionary: dictionary)))
        }
    }

    public func logoutRequest(completion: @escaping(APIRequestResult) -> Void) {
        switch closurePathway {
        case .failedRequest(_):
            completion(.failedRequest(message: "failed logoutRequest"))
        case .succesfullRequest:
            completion(.succesfullRequest)
        }
    }
}
