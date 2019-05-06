//
//  PhotoDetailDefaultInteractor.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit

class PhotoDetailDefaultInteractor {
    var photoItem: PhotoItem!
    var photoImage: UIImage!
    
}

extension PhotoDetailDefaultInteractor: PhotoDetailInteractorProtocol {
    func fetchPhotoImage() -> UIImage {
        return photoImage
    }
    
    func fetchPhotoItem() -> PhotoItem {
        return photoItem
    }
}
