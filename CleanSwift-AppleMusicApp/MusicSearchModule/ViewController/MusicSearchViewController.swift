//
//  MusicSearchViewController.swift
//  CleanSwift-AppleMusicApp
//
//  Created by Igor Shefer on 22.08.23.
//

import Foundation
import UIKit

protocol MusicSearchViewControllerProtocol {
    func changeBackgroundColor(color: UIColor)
    func presentLoadedSongs(loadedSongs: [MusicSearchModels.FetchMusicBySearching.ResponseViewModel])
    func presentErrorMessage(message: String)
}

class MusicSearchViewController: UIViewController {
    var interactor: MusicSearchInteractorProtocol?
    
    // Set up your UI elements and outlets here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did launch")
        interactor?.changeBackgroundColor(color: .yellow)
        interactor?.fetchMusicResults(request: .init(inputedTextInSearchField: "Linkin Park"))
        // Call interactor to fetch initial data
    }
    
    // Implement your UI update methods here
}

extension MusicSearchViewController: MusicSearchViewControllerProtocol {
    
    func changeBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    func presentLoadedSongs(loadedSongs: [MusicSearchModels.FetchMusicBySearching.ResponseViewModel]) {
        print("LoadedSongs: \(loadedSongs)")
    }
    
    func presentErrorMessage(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Dismiss", style: .destructive)
        alertController.addAction(cancelButton)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    
}
