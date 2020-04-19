//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public class ProfileMockViewModel: ProfileViewModelProtocol {
    public var logoutRequestCalled: Bool = false
    public var getUserProfileCalled: Bool = false
    public required init(viewController: ProfileViewControllerProtocol, repo: ProfileRepoProtocol) {
    }
    
    public func getUserProfile() {
        getUserProfileCalled = true
    }
    
    public func logoutRequest() {
        logoutRequestCalled = true
    }
    
    
}
