import Foundation
import AVKit

public class ProfileViewModel: ProfileViewModelProtocol {
    var profileRepo: ProfileRepoProtocol
    var viewController: ProfileViewControllerProtocol
    required public init(viewController: ProfileViewControllerProtocol, repo: ProfileRepoProtocol) {
        self.profileRepo = repo
        self.viewController = viewController
    }
    public func getUserProfile() {
        self.profileRepo.getUserProfile { [weak self] result in
            switch result {
            case .failure(.failedRequest(let message)):
                self?.viewController.failedProfileRequest(errorMessage: message)
            case .success(let profileModel):
                self?.viewController.successfulRequest(profileModel: profileModel)
            }
        }
    }
    public func logoutRequest() {
        self.profileRepo.logoutRequest { [weak self] result in
                switch result {
                case .failedRequest(let message):
                    self?.viewController.failedLogoutRequest(errorMessage: message)
                case .succesfullRequest:
                    self?.viewController.successfulLogout()
            }
        }
    }
}
