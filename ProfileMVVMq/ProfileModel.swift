
import Foundation
import AVKit

enum Gender {
    case male
    case female
    case notSpecified
}

public struct ProfileModel {
    var gender: Gender = .notSpecified
    var email: String = "N/A"
    var noPlaylists: Int = 0

    var dict: [String: Any] {
        return [
            "uid": gender,
            "name": email,
            "email": noPlaylists
        ]
    }

    init(dictionary: NSDictionary) {
        /*
         TO DO: add functionality to receive objects from Firebase Database reference
         snapshotsguard let userID = dict["userID"] as? String, email = dict["email"]
         as? String, creationDate = dict["creationDate"] as? String else { return nil
            }
         */
        guard let email = dictionary.value(forKey: "email") as? String,
        let titName = dictionary.value(forKey: "titleName") as? String,
        let preUrl = dictionary.value(forKey: "previewUrl") as? String else {
            return
        }

        gender = .male
        self.email = email
        noPlaylists = 0
    }
    
}
