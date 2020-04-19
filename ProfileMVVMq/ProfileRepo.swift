
import Foundation
import AVKit
import FirebaseAuth
import FirebaseDatabase

protocol ProfileRepoProtocol {
    func getUserProfile(completion: @escaping(Result<ProfileModel, APIFailureResult>) -> Void)
}

public class ProfileRepo: ProfileRepoProtocol {
    lazy var firebaseService: FirebaseServiceProtocol = {return FirebaseService()}()
    lazy var firebaseAuth: FirebaseServiceProtocol = {return FirebaseService()}()
    private let ref: DatabaseReference! = Database.database().reference()

    public func setServiceProvider(service: FirebaseServiceProtocol) {
        self.firebaseService = service
    }

    public func getUserProfile(completion: @escaping(Result<ProfileModel, APIFailureResult>) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(.failure(.failedRequest(message: "User not logged in")))
            return
        }
        self.ref.child("users/\(currentUser.uid)").observeSingleEvent(of: .value, with: { /*[weak self]*/ (snapshot) in
            let value = snapshot.value as? NSDictionary
            guard let result = value else {
                completion(.failure(.failedRequest(message: "User not logged in")))
                return
            }
            completion(.success(ProfileModel(dictionary: result)))
        })
    }
//    public func postTrending(trendingArtists: TrendingArtistModel,
//                             completion: @escaping (Result<Bool, Error>) -> Void) {
//        try? self.nlibraryService.postTrending(trendingArtist: trendingArtists) { handler in
//             switch (handler) {
//             case .success( _):
//                 completion(.success(true))
//             default:
//                 completion(.failure(ArtistMediaError.canNotProcessData))
//             }
//         }
//    }
}
