//
//  PhotoDetailInteractorProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit

protocol PhotoDetailInteractorProtocol {
    
    func fetchPhotoItem() -> PhotoItem
    func fetchPhotoImage() -> UIImage
}
