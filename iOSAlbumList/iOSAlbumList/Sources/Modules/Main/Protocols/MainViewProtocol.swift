//
//  MainViewProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit

protocol MainViewProtocol: class {
    
    var presenter: MainPresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func showAlbums(_ albums: [AlbumItem])
    func showErrorMessage(_ message: String)
}
