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
    
    static func createAlbumDetailRouterModule(with album: AlbumItem) -> UIViewController
    func navigateBackToAlbumListViewController(from view: AlbumDetailViewProtocol)
    
}
