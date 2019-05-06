//
//  PhotoDetailRouter.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import Foundation
import UIKit

protocol PhotoDetailRouterProtocol {
    
    static func createPhotoDetailRouterModule(photoItem photo: PhotoItem, withImage image: UIImage) -> UIViewController
    func navigateBackToListViewController(from view: AlbumDetailViewProtocol)
    
}
