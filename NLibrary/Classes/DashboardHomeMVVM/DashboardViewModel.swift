
import Foundation
import AVKit

@available(iOS 13.0, *)
public class DashboardViewModel: DashboardViewModelProtocol {
    public func postTrendingSong(index: Int) {
        guard index < self.trendingArtists.count else {
            return
        }
        self.repo?.postTrending(trendingArtists: self.trendingArtists[index]) { [weak self] result in
            switch result {
            case .success( _):
                self?.getTrending()
            default:
                break;
            }
        }
    }

    var userName: String = ""
    var recentPlayedList: [RecentSong] = []
    var numFollowers: [String] = []
    var trendingArtists: [TrendingArtistModel] = []
    public var currentPlayingIndex: Int = -1
    private var repo: DashboardRepoProtocol?
    weak var viewController: DashboardViewControllerProtocol?
    lazy var musicPlayer: AVPlayer = {return AVPlayer()}()

    required public init(viewController: DashboardViewControllerProtocol,
                         repo: DashboardRepoProtocol) {
        self.repo = repo
        self.viewController = viewController
        repo.setViewModel(viewModel: self)
    }

    public func loadContent() {
        self.repo?.getDashboardContent()
    }

    public func successFulRecentSongsReceived(songsModel: [RecentSongModel]) {
        recentPlayedList.removeAll()
        for model in songsModel {
            recentPlayedList.append(RecentSong(model: model))
        }
        self.viewController?.successFulSongRequests(songs: recentPlayedList)
    }

    public func getTrending() {
        self.repo?.getTrending { [weak self] result in
            switch result {
            case .success(let trendingArtists):
                self?.trendingArtists = trendingArtists
                self?.viewController?.successfulTrendingArtists(trendingArtists: trendingArtists)
            default:
                break;
            }
        }
    }
}
