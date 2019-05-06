//
//  AlbumDetailRouterProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import UIKit

protocol AlbumDetailRouterProtocol {
    // route for init album detail module
    static func createAlbumDetailRouterModule(with album: AlbumItem) -> UIViewController
    // func for pop module
    func navigateBackToAlbumListViewController(from view: AlbumDetailViewProtocol)
    // route for photo detail module
    func presentPhotoDetailScreen(from view: AlbumDetailViewProtocol, for photo: PhotoItem, image fetchedPhoto: UIImage)
}
