//
//  HomeDefaultRouter.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDefaultRouter {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "MainAlbumDetail", bundle: Bundle.main)
    }
}

extension AlbumDetailDefaultRouter: AlbumDetailRouterProtocol {
    func navigateBackToAlbumListViewController(from view: AlbumDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    static func createAlbumDetailRouterModule(with album: AlbumItem) -> UIViewController {
        guard let albumDetailVC = storyboard.instantiateViewController(withIdentifier: "AlbumDetailDefaultViewController") as? AlbumDetailDefaultViewController else {
            fatalError("Invalid view controller type")
        }
        
        let presenter = AlbumDetailDefaultPresenter()
        let interactor = AlbumDetailDefaultInteractor()
        let router = AlbumDetailDefaultRouter()
        
        albumDetailVC.presenter = presenter
        interactor.album = album
        presenter.interactor = interactor
        presenter.router = router
        
        return albumDetailVC
    }
}

