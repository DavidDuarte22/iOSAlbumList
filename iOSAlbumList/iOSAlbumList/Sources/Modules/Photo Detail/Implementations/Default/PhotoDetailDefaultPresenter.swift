//
//  PhotoDetailDefaultPresenter.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
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
    
    func removeView(view: PhotoDetailViewProtocol) {
        router?.navigateBackToListViewController(from: view)
    }
}
