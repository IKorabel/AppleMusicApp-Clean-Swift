//
//  MusicSearchPresenter.swift
//  CleanSwift-AppleMusicApp
//
//  Created by Igor Shefer on 22.08.23.
//

import Foundation
import UIKit

protocol MusicSearchPresenterProtocol {
    
    func changeBackgroundColor(color: UIColor)
    func presentSongResults(songs: [MusicSearchModels.FetchMusicBySearching.Response])
    func presentErrorMessage(error: Error)
    // Presenter protocol
}

class MusicSearchPresenter: MusicSearchPresenterProtocol {
    weak var viewController: MusicSearchViewController?
    
    func changeBackgroundColor(color: UIColor) {
        viewController?.changeBackgroundColor(color: color)
    }
    
    func presentSongResults(songs: [MusicSearchModels.FetchMusicBySearching.Response]) {
        var loadedSongsViewModel = [MusicSearchModels.FetchMusicBySearching.ResponseViewModel]()
        
        songs.forEach { song in
            let loadedSongViewModel = MusicSearchModels.FetchMusicBySearching.ResponseViewModel(name: song.song.title,
                                                                                                 artist: song.song.artistName,
                                                                                                 imageUrl: song.song.artwork?.url(width: 70, height: 70))
            loadedSongsViewModel.append(loadedSongViewModel)
        }
        viewController?.presentLoadedSongs(loadedSongs: loadedSongsViewModel)
    }
    
    func presentErrorMessage(error: Error) {
        viewController?.presentErrorMessage(message: error.localizedDescription)
    }
    // Implement presenter methods here
}
