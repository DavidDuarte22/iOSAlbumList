//
//  MainDefaultRouter.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit

class MainDefaultRouter {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "MainAlbumList", bundle: Bundle.main)
    }

}

extension MainDefaultRouter: MainRouterProtocol {
    static func instanciateHomeModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        guard let HomeViewController = navController.topViewController as? MainDefaultViewController else { fatalError("Invalid View Controller") }
        
        let presenter = MainDefaultPresenter()
        let interactor = MainDefaultInteractor()
        let router = MainDefaultRouter()
        
        HomeViewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return navController
    }
    
    func presentToDoDetailScreen(from view: MainViewProtocol, for album: AlbumItem) {
        
    }
    
}
