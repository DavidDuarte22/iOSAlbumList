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
                self.albumsCollectionView.reloadData()
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
    
    // setting layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = 158 * 2
        let totalSpacingWidth = 20 * (2 - 1)
        
        let leftInset = (albumsCollectionView.contentSize.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    // get cell class 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumsCollectionView.dequeueReusableCell(withReuseIdentifier: "albumCard", for: indexPath) as! AlbumCardCollectionViewCell
        cell.albumTitle.text = albums[indexPath.row].title
        return cell
    }
}

extension MainDefaultViewController: MainViewProtocol {
    func showAlbums(_ albums: [AlbumItem]) {
    }
    
    func showErrorMessage(_ message: String) {
    }
}
