//
//  MusicSearchConfigurator.swift
//  CleanSwift-AppleMusicApp
//
//  Created by Igor Shefer on 22.08.23.
//

import Foundation
import UIKit

class MusicSearchConfigurator {
    
    static func build() -> UIViewController {
        let view = MusicSearchViewController()
        let interactor = MusicSearchInteractor()
        let presenter = MusicSearchPresenter()
        let worker = MusicSearchWorker()

        view.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = view
        return view
    }
}
