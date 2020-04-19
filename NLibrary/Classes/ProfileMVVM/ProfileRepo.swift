
import Foundation
import AVKit
import FirebaseAuth
import FirebaseDatabase

public class ProfileRepo: ProfileRepoProtocol {
    lazy var firebaseAuth: FirebaseServiceProtocol = {return FirebaseService()}()
    private let ref: DatabaseReference! = Database.database().reference()
    required public init () {
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

    public func logoutRequest(completion: @escaping(APIRequestResult) -> Void) {
        do {
            // TO DO: cancel observers hanging
            try Auth.auth().signOut()
            completion(.succesfullRequest)
        } catch (let error){
            completion(.failedRequest(message: error.localizedDescription))
        }
    }
    
    
}
