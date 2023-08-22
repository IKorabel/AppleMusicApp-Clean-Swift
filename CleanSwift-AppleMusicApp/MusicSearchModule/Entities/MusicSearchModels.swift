//
//  MusicSearchModels.swift
//  CleanSwift-AppleMusicApp
//
//  Created by Igor Shefer on 22.08.23.
//

import Foundation
import MusicKit


enum MusicSearchModels {
    
    //Fetch Music Searching Cycle
    enum FetchMusicBySearching {
        
        struct Request {
            var request: MusicCatalogSearchRequest?
            
            init(inputedTextInSearchField: String) {
                self.request = buildMusicCatalogSearchRequest(withTextFromSearchField: inputedTextInSearchField)
            }
            
            private func buildMusicCatalogSearchRequest(withTextFromSearchField: String) -> MusicCatalogSearchRequest {
                var musicCatalogSearchRequest = MusicCatalogSearchRequest(term: withTextFromSearchField, types: [Song.self])
                musicCatalogSearchRequest.limit = 15
                return musicCatalogSearchRequest
            }
        }
        
        struct Response {
            var song: Song
        }
        
        struct ResponseViewModel {
            var name: String
            var artist: String
            var imageUrl: URL?
            
        }
        
        struct FetchError: Error {
            
        }
    }
}
