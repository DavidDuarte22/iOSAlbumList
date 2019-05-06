//
//  HomeDefaultView.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import UIKit
import RxSwift

class AlbumDetailDefaultViewController: UIViewController {
    
    var presenter: AlbumDetailPresenterProtocol?
    var album: AlbumItem!
    var photos: [PhotoItem]?
    // Dispose bag for RxSwift
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.title = album?.title
        let backItem = UIBarButtonItem()
        backItem.title = " "
        self.navigationItem.backBarButtonItem = backItem
        
    }
    
    override func viewDidLoad() {
        
        // subscribing to presenter's observer
        subscribeToObserver((self.presenter?.presenterToViewSubject)!)
        // fetching album and asking for the photos of the album
        self.album = presenter?.showAlbum()
        presenter?.showPhotos()
        // collection view delegates
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        // setting size of cell adjusting to device
        (self.photosCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = CGSize(width: UIScreen.main.bounds.width/3 - 10.0, height: UIScreen.main.bounds.width/3 - 10.0)
        

    }
    
    func subscribeToObserver (_ subject: PublishSubject<[PhotoItem]>) {
        subject.subscribe(
            onNext: {(photos) in
                // update photos
                self.photos = photos
                self.photosCollectionView.reloadData()
        },
            onError: {(error) in
                print(error)
        }).disposed(by: disposeBag)
    }
}

extension AlbumDetailDefaultViewController: UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Make logic in presenter
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCard", for: indexPath) as! PhotoCollectionViewCell
        
        return (presenter?.fillCollectionViewCell(collectionView: self.photosCollectionView, cellForItemAt: indexPath, cell: cell, photo: self.photos![indexPath.row]))!
        
    }
    // setting layout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.photosCollectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        if cell.photoImage.image != nil {
            presenter?.showPhotoDetail(self, photos![indexPath.row], cell.photoImage.image!)
        }
    }
}

extension AlbumDetailDefaultViewController: AlbumDetailViewProtocol {
    
    

}
