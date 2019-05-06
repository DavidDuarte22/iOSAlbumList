//
//  PhotoDetailDefaultInteractor.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
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
