import Foundation
import AVKit

public enum Gender {
    case male
    case female
    case notSpecified

    public var stringValue: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .notSpecified:
            return "notSpecified"
        }
    }
}

public struct ProfileModel {
    public var gender: Gender = .notSpecified
    public var email: String = "N/A"
    public var noPlaylists: Int = 0
    public var name: String = "N/A"

    var dict: [String: Any] {
        return [
            "gender": gender.stringValue,
            "name": name,
            "email": email,
            "noPlaylists": noPlaylists
        ]
    }

    init(dictionary: NSDictionary) {
        if let email = dictionary.value(forKey: "email") as? String {
            self.email = email
        }
        if let playlistTitles = dictionary.value(forKey: "Playlists") as? [String: Any] {
            self.noPlaylists = playlistTitles.count
        }
        if let gender = dictionary.value(forKey: "gender") as? String {
            switch gender {
            case Gender.male.stringValue: self.gender = .male
            case Gender.female.stringValue: self.gender = .female
            default: self.gender = .notSpecified
            }
        }
        if let name = dictionary.value(forKey: "name") as? String {
            self.name = name
        }
    }
}
