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
         self.ref.child("playlists")
            .queryOrdered(byChild: "producerId")
            .queryEqual(toValue: currentUser.uid)
            .observe(.value, with: { /*[weak self]*/ (snapshot) in
                var playlists: [PlaylistModel] = []
                for child in snapshot.children {
                    guard let childSnap = child as? DataSnapshot,
                        let childValue = childSnap.value else {
                        return
                    }
                    let value = [childSnap.key: childValue] as NSDictionary
                    playlists.append( PlaylistModel(dictionary: value))
                    print (playlists)
                }
                self.viewModel?.successfulRequest(playlistModels: playlists)
         })
    }

    public func createPlaylist(playlistName: String) {
        firebaseService.createPlaylist(playlistName: playlistName)
    }
}
