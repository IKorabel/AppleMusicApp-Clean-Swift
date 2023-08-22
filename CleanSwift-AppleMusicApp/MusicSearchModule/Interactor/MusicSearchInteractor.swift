//
//  MusicSearchInteractor.swift
//  CleanSwift-AppleMusicApp
//
//  Created by Igor Shefer on 22.08.23.
//

import Foundation
import UIKit

protocol MusicSearchInteractorProtocol {
    func changeBackgroundColor(color: UIColor)
    func fetchMusicResults(request: MusicSearchModels.FetchMusicBySearching.Request)    // Interactor protocol
}

class MusicSearchInteractor: MusicSearchInteractorProtocol {
    var presenter: MusicSearchPresenterProtocol?
    var worker: MusicSearchWorkerProtocol?
    
    
    func changeBackgroundColor(color: UIColor) {
        presenter?.changeBackgroundColor(color: color)
    }
    
    func fetchMusicResults(request: MusicSearchModels.FetchMusicBySearching.Request) {
        guard let worker else { return }
           Task {
               do {
                   let results = try await worker.fetchSearchedMusic(withRequest: request)
                   presenter?.presentSongResults(songs: results)
               } catch {
                   presenter?.presentErrorMessage(error: error)
               }
           }
    }
}
