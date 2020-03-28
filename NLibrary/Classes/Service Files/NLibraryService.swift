import Foundation

//public enum APIRequestResult: Error {
//    case failedRequest(message: String)
//    case succesfullRequest
//}

@objc public class NLibrarySerivce: NSObject {
    private var repo: SearchSongRepoProtocol?
    var resourceURL: URL?

    init(repo: SearchSongRepoProtocol) {
        self.repo = repo
    }

    public func getSongs(artistName: String) throws {
                let resourceString = "https://itunes.apple.com/search?term=\(artistName)"
                guard let resourceURL = URL(string: resourceString)
                    else { throw ArtistMediaError.invalidName }
                self.resourceURL = resourceURL
        
                let dataTask = URLSession.shared.dataTask(with: self.resourceURL!) { [weak self] data, _, _ in
                    self?.repo?.successfulRequest(jsonData: data)
                }
                dataTask.resume()
    }
}
