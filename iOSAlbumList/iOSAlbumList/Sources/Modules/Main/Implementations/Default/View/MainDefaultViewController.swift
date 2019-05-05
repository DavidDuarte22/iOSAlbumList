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
        
        // delegates for collectionview
        albumsCollectionView.dataSource = self
        albumsCollectionView.delegate = self
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

// Extension of collection view
extension MainDefaultViewController: UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // get count of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    // get cell class 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumsCollectionView.dequeueReusableCell(withReuseIdentifier: "albumCard", for: indexPath) as! AlbumCardCollectionViewCell
        return cell
    }
}

extension MainDefaultViewController: MainViewProtocol {
    func showAlbums(_ albums: [AlbumItem]) {
    }
    
    func showErrorMessage(_ message: String) {
    }
}
