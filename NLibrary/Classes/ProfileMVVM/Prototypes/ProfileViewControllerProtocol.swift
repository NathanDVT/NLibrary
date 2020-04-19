
import Foundation
import AVKit

public protocol ProfileViewControllerProtocol: class {
    func successfulRequest(profileModel: ProfileModel)
    func successfulLogout()
}
