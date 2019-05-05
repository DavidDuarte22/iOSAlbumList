//
//  AlbumDetailPresenterProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import RxSwift

protocol AlbumDetailPresenterProtocol: class {
    
    var router: AlbumDetailRouterProtocol? { get set }
    var interactor: AlbumDetailInteractorProtocol? { get set }
    var presenterToViewSubject: PublishSubject<[PhotoItem]>? { get }

    //To Router
    func showPhotoDetail(_ view: AlbumDetailViewProtocol, _ photo: PhotoItem, _ photoImage: UIImage)
    // To Interactor
    func showAlbum() -> AlbumItem
    func showPhotos()
    // Logic of View
    func fillCollectionViewCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, cell: PhotoCollectionViewCell, photo: PhotoItem) -> UICollectionViewCell
}
