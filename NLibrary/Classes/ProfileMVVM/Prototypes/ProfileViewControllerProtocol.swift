import Foundation
import AVKit

public protocol ProfileViewControllerProtocol: class {
    func successfulRequest(profileModel: ProfileModel)
    func successfulLogout()
    func failedProfileRequest(errorMessage: String)
    func failedLogoutRequest(errorMessage: String)
}
