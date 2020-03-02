//public let hi:String = "ds"

// MODEL ---------------------------------------------
public struct ArtistMediaResponse: Decodable {
    public var results: [Collection]
    public init(){
        results = []
    }
}

public struct Collection: Decodable {
    public var artistName: String
    public var collectionName: String
    public var releaseDate: String
    public var artworkUrl30: String
    public var collectionPrice: Double
    public var trackTimeMillis: Int
    public var artworkUrl60: String
    public var previewUrl: String
    public init(){
        artistName = ""
        collectionName = ""
        releaseDate = ""
        artworkUrl30 = ""
        artworkUrl60 = ""
        previewUrl = ""
        trackTimeMillis = 0
        collectionPrice = 0
    }
}


// ViewModel --------------------------------------------

public enum ArtistMediaError: Error {
    case noDataAvailable
    case canNotProcessData
}

public struct ArtistMediaRequest {
    let resourceURL: URL

    public init(artistName: String) {
        let resourceString = "https://itunes.apple.com/search?term=\(artistName)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }

    public func getArtistMedia (completion: @escaping(Result<[Collection], ArtistMediaError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let artistMediaResponse = try decoder.decode(ArtistMediaResponse.self, from: jsonData)
                let collections = artistMediaResponse.results
                completion(.success(collections))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}

