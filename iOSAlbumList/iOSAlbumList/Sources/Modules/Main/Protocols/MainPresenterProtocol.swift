//
//  MainPresenterProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol: class {
    
    var router: MainRouterProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    
    func showAlbums()
    func showAlbumDetail(_ view: MainViewProtocol, _ album: AlbumItem)
}
