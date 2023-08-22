//
//  MusicKitManager.swift
//  CleanSwift-AppleMusicApp
//
//  Created by Igor Shefer on 22.08.23.
//

import Foundation
import MusicKit

class MusicKitManager {
    
    
    func findMusicBySearching(searchRequest: MusicSearchModels.FetchMusicBySearching.Request) async throws -> [MusicSearchModels.FetchMusicBySearching.Response] {
        var response = [MusicSearchModels.FetchMusicBySearching.Response]()
        
        let status = await MusicAuthorization.request()
        guard let searchRequest = searchRequest.request else { return response }
        
        switch status {
        case .authorized:
            do {
                let result = try await searchRequest.response()
                response = result.songs.map { song in
                    return MusicSearchModels.FetchMusicBySearching.Response(song: song)
                }
            } catch let searchRequestError {
                throw searchRequestError
            }
            
        default:
            // Handle other cases or errors here
            break
        }
        
        return response
    }

    
}
