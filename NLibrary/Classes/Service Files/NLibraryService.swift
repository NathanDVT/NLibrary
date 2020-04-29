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

    override public init()  {

    }

    public func getSongs(artistName: String) throws {
        let artistName = artistName.replacingOccurrences(of: " ", with: "+")
        let resourceString = "https://itunes.apple.com/search?term=\(artistName)"
        guard let resourceURL = URL(string: resourceString)
            else { throw ArtistMediaError.invalidName }
        self.resourceURL = resourceURL
        let dataTask = URLSession.shared.dataTask(with: self.resourceURL!) { [weak self] data, _, _ in
            self?.repo?.successfulRequest(jsonData: data)
        }
        dataTask.resume()
    }
    
    public func getTrending(completion: @escaping (Result<Data, Error>) -> Void) throws {
        let resourceString = "http://localhost:8080"
        guard let resourceURL = URL(string: resourceString)
            else { throw ArtistMediaError.invalidName }
        self.resourceURL = resourceURL
        let dataTask = URLSession.shared.dataTask(with: self.resourceURL!) { data, _, _ in
            if data != nil {
            completion(.success(data!))
            } else {
                completion(.failure(ArtistMediaError.canNotProcessData))
            }
        }
        dataTask.resume()
    }

    public func postTrending(trendingArtist: TrendingArtistModel, completion : @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: "http://localhost:8080")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let newTodoItem = trendingArtist
        do {
        let jsonData = try JSONEncoder().encode(newTodoItem)
            request.httpBody = jsonData
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
                    if error != nil {
                        completion(.failure(ArtistMediaError.canNotProcessData))
                        return
                    }
                    guard data != nil else {return}
                    do{
                        completion(.success(data!))
                    } catch let jsonErr{
                        completion(.failure(ArtistMediaError.canNotProcessData))
                        return
                   }
            }
            task.resume()
        } catch { }
    }
}
