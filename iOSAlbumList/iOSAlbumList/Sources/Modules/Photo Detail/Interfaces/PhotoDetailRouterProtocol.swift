//
//  PhotoDetailRouterProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoDetailRouterProtocol {
    
    static func createPhotoDetailRouterModule(photoItem photo: PhotoItem, withImage image: UIImage) -> UIViewController
    func navigateBackToListViewController(from view: PhotoDetailViewProtocol)
    
}
