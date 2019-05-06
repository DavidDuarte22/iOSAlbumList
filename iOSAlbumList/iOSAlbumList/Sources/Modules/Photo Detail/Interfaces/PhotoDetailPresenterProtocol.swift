//
//  PhotoDetailPresenterProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit

protocol PhotoDetailPresenterProtocol: class {
    
    var router: PhotoDetailRouterProtocol? { get set }
    var interactor: PhotoDetailInteractorProtocol? { get set }
    
    func showPhotoItem() -> PhotoItem
    func showPhotoImage() -> UIImage 
}
