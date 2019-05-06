//
//  PhotoDetailDefaultPresenter.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import UIKit

class PhotoDetailDefaultPresenter {
    
    var router: PhotoDetailRouterProtocol?
    var interactor: PhotoDetailInteractorProtocol?
    
}

extension PhotoDetailDefaultPresenter: PhotoDetailPresenterProtocol {
    func showPhotoItem() -> PhotoItem {
        let photo = interactor?.fetchPhotoItem()
        return photo!
    }
    
    func showPhotoImage() -> UIImage {
        let photoImage = interactor?.fetchPhotoImage()
        return photoImage!
    }
}
