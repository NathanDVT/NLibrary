//
//  UserProtocol.swift
//  taylorswift
//
//  Created by Nathan Ngobale on 2020/03/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation

public class FirebaseServiceMock: NSObject, FirebaseServiceProtocol {
    public func getUserPlaylistDetails() {

    }

    public func getUserPlaylistsNames() {

    }

    public func getUserPlaylists() {
    }

    public func logout() {

    }

    public func signUpAndAddNewUser(email: String, password: String) {
        self.email = email
        self.password = password
    }
    var dashboardRepo: DashboardRepoProtocol?
    public var email: String = ""
    public var password: String = ""
    public var calledGetDashboardItems: Bool = false

    required public init(repo: SignUpRepoProtocol) {

    }

    required public init(repo: SearchSongRepoProtocol){

    }

    required public init(repo: DashboardRepoProtocol) {
        
    }

    required public init(repoSignIn: LoginRepoProtocol) {
        
    }

    public func signIn(email: String, password: String) {
        self.email = email
        self.password = password
    }

    public func signIn(email: String, password: String, completion: @escaping(APIRequestResult) -> Void) {
        
    }

    public func addUserToDB(newUser: UserModel, completion: @escaping(APIRequestResult) -> Void) {
        
    }

    public func signUp(email: String, password: String, completion: @escaping(APIRequestResult) -> Void) {
        
    }
    public func addSongToRecent(songDTO: RecentSongModel) {
        
    }

    public func createPlaylist(playlistName: String) {
        
    }

    public func getDashboardItems() {
        calledGetDashboardItems = true
    }

    public func getUserNameToDashboard() {
        
    }

    public func getRecentSongsToDashboard() {
        
    }
}
