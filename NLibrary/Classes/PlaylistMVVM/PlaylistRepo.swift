//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import AVKit

public class PlaylistRepo {
    private let ref: DatabaseReference! = Database.database().reference()
    var viewModel: PlaylistViewModel?
    lazy var firebaseService: FirebaseService = {return FirebaseService(repo: self)}()

    public init() {

    }

    public func addSongToRecent(songDTO: RecentSongModel) {
    }

    public func setViewModel(viewModel: PlaylistViewModel) {
        self.viewModel = viewModel
    }

    public func getUserPlaylistDetails() {
        guard let currentUser = Auth.auth().currentUser else {
             return
         }
         self.ref.child("Playlists/\(currentUser.uid)")
             .observe(.value, with: { [weak self] (snapshot) in
                let value = [snapshot.key: snapshot.value!] as NSDictionary
                let playlistModel: PlaylistBasicModel? = PlaylistBasicModel(dict: value)
                self?.viewModel?.successfulRequest(playlist: playlistModel!)
         })
    }

    public func successfulGetUserPlaylists(dictionary: NSDictionary) {
//        var recentSongModels: [PlaylistItemBasicModel] = []
//        var playlistModel: PlaylistBasicModel? = PlaylistBasicModel(dict: dictionary)
//        viewModel?.successfulRequest(songs: playlistModel!.playlistItems)
    }

    public func createPlaylist(playlistName: String) {
        firebaseService.createPlaylist(playlistName: playlistName)
    }
}
