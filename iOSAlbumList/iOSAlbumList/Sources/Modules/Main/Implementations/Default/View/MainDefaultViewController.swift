//
//  MainDefaultView.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit
import RxSwift

class MainDefaultViewController: UIViewController {
    
    var presenter: MainPresenterProtocol?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    
    var albums: [AlbumItem] = []
    
    override func viewDidLoad() {
        // subscribing to presenter observer
        subscribeToObserver((self.presenter?.presenterToViewSubject)!)
        // fetching albums
        self.presenter?.showAlbums()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func subscribeToObserver (_ subject: PublishSubject<[AlbumItem]>) {
        subject.subscribe(
            onNext: {(albums) in
                self.albums = albums
        },
            onError: {(error) in
                print(error)
        }).disposed(by: disposeBag)
    }
}


extension MainDefaultViewController: MainViewProtocol {
    func showAlbums(_ albums: [AlbumItem]) {
    }
    
    func showErrorMessage(_ message: String) {
    }
}
