
import Foundation
import AVKit

public class ProfileViewModel {
    var profileRepo: ProfileRepoProtocol
    init(profileRepo: ProfileRepoProtocol) {
        self.profileRepo = profileRepo
    }
    public func getUserProfile() {
        self.profileRepo.getUserProfile { result in
            switch result {
            case .failure(.failedRequest(let message)):
                print(message)
            case .success(let profileModel):
                print(profileModel)
            }
        }
    }
}
