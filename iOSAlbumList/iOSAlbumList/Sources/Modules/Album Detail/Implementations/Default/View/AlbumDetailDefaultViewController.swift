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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // subscribing to presenter's observer
        subscribeToObserver((self.presenter?.presenterToViewSubject)!)
        // fetching album and asking for the photos of the album
        self.album = presenter?.showAlbum()
        presenter?.showPhotos()
        
        self.navigationItem.title = album?.title
        let backItem = UIBarButtonItem()
        backItem.title = " "
        self.navigationItem.backBarButtonItem = backItem
        
    }
    
    func subscribeToObserver (_ subject: PublishSubject<[PhotoItem]>) {
        subject.subscribe(
            onNext: {(photos) in
                // update photos
                self.photos = photos
        },
            onError: {(error) in
                print(error)
        }).disposed(by: disposeBag)
    }
}

extension AlbumDetailDefaultViewController: AlbumDetailViewProtocol {
    
    

}
