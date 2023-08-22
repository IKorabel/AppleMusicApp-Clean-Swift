//
//  MusicSearchWorker.swift
//  CleanSwift-AppleMusicApp
//
//  Created by Igor Shefer on 22.08.23.
//

import Foundation

protocol MusicSearchWorkerProtocol {
    // Worker protocol
    func fetchSearchedMusic(withRequest: MusicSearchModels.FetchMusicBySearching.Request) async throws -> [MusicSearchModels.FetchMusicBySearching.Response]
}

class MusicSearchWorker: MusicSearchWorkerProtocol {
    let musicKitManager = MusicKitManager()
    
    // Implement worker methods here
    func fetchSearchedMusic(withRequest: MusicSearchModels.FetchMusicBySearching.Request) async throws -> [MusicSearchModels.FetchMusicBySearching.Response] {
        do {
            let foundedMusic = try await musicKitManager.findMusicBySearching(searchRequest: withRequest)
            return foundedMusic
        } catch {
            throw error
        }
    }
    
}
