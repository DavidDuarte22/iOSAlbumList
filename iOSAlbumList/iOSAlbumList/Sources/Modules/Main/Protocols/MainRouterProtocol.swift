//
//  MainRouterProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit

protocol MainRouterProtocol {
    
    static func instanciateHomeModule() -> UIViewController
        
    // PRESENTER -> ROUTER
    func presentAlbumDetailScreen(from view: MainViewProtocol, with album: AlbumItem)
}
