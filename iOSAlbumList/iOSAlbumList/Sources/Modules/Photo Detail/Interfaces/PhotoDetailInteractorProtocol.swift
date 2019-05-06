//
//  PhotoDetailInteractor.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import UIKit

protocol PhotoDetailInteractorProtocol {
    
    func fetchPhotoItem() -> PhotoItem
    func fetchPhotoImage() -> UIImage
}
