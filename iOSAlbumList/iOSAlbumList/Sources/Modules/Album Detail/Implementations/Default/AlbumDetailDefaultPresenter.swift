//
//  HomeDefaultPresenter.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import RxSwift

class AlbumDetailDefaultPresenter {
    
    var router: AlbumDetailRouterProtocol?
    var interactor: AlbumDetailInteractorProtocol?
    
    var presenterToViewSubject: PublishSubject<[PhotoItem]>?
    let disposeBag = DisposeBag()
    
    init() {
        self.presenterToViewSubject = PublishSubject<[PhotoItem]>()
    }
}

extension AlbumDetailDefaultPresenter: AlbumDetailPresenterProtocol {
    func showAlbum() -> AlbumItem {
        let album = interactor?.fetchAlbum()
        return album!
    }
    
    func showPhotos() {
        // asking for photos and subscribing to subject waiting for the update
        interactor?.fetchPhotos()
        let subscription = self.interactor?.interactorToPresenterSubject?.subscribe(
            onNext: {(photos) in
                // when the interactor fetch the photos, notify the view the changes
                self.presenterToViewSubject?.onNext(photos)
        },
            onError: {(error) in 
                self.presenterToViewSubject?.onError(error)
        })
        subscription?.disposed(by: disposeBag)
    }

    func fillCollectionViewCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, cell: PhotoCollectionViewCell, photo: PhotoItem) -> UICollectionViewCell {
        // fetch image by url async
        let queue = OperationQueue()
        queue.addOperation {() -> Void in
            do {
                /* block for fetch photo */
                let url = URL(string: "\(photo.thumbnailUrl)")!
                let data = try Data(contentsOf: url)
                let img = UIImage(data: data)
                /* */
                // display in cell when has it image
                OperationQueue.main.addOperation({ () -> Void in
                    /* simple animation */
                    cell.alpha = 0
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0.05 * Double(indexPath.row),
                        animations: {
                            cell.alpha = 1
                    })
                    /* */
                    cell.photoImage.image = img
                })
            } catch {
                // if error don't display image
                cell.photoImage.image = nil
            }
        }
        return cell
    }
    
    func showPhotoDetail(_ view: AlbumDetailViewProtocol, _ photo: PhotoItem, _ photoFetched: UIImage) {
        router?.presentPhotoDetailScreen(from: view, for: photo, image: photoFetched)
    }

}
