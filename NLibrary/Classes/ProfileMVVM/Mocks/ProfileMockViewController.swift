//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public class ProfileMockViewController: ProfileViewControllerProtocol {
    public var profileModel: ProfileModel!
    public var failedRequestMessage: String = ""
    public var failedLogoutMessage: String = ""
    public var succesfulLogoutCalled: Bool = false
    public func successfulRequest(profileModel: ProfileModel) {
        self.profileModel = profileModel
    }
    public func successfulLogout() {
        succesfulLogoutCalled = true
    }
    public func failedLogoutRequest(errorMessage: String) {
        failedLogoutMessage = errorMessage
    }
    public func failedProfileRequest(errorMessage: String) {
        failedRequestMessage = errorMessage
    }
}
