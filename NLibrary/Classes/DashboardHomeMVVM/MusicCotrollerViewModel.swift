//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import AVKit

public class MusicControllerViewModel {
    lazy var musicPlayer: AVPlayer = {return AVPlayer()}()
    var name: String = "Select song to play"

    public init() {
    }

    public func playFromUrlWithTitle(urlString: String, title: String) {
            guard let url = URL.init(string: urlString) else {
            return
        }
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        self.musicPlayer.replaceCurrentItem(with: playerItem)
        musicPlayer.play()
        self.name = title
    }

    public func getArtistName() -> String {
        return name
    }

    public func isPlaying() -> Bool {
        return musicPlayer.rate != 0;
    }

    public func pauseOrPlayCurrentSong() {
        guard musicPlayer.error == nil else {
            return
        }
        if musicPlayer.rate != 0 {
            musicPlayer.pause()
        } else {
            musicPlayer.play()
        }
    }
}
