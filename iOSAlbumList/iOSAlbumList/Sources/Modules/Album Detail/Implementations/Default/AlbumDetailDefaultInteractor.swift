//
//  HomeDefaultInteractor.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import RxSwift

class AlbumDetailDefaultInteractor {
    var album: AlbumItem!
    
    var interactorToPresenterSubject: PublishSubject<[PhotoItem]>?
    
    init() {
        self.interactorToPresenterSubject = PublishSubject<[PhotoItem]>()
    }
    
    let httpclient = HttpClient.init()
}

extension AlbumDetailDefaultInteractor: AlbumDetailInteractorProtocol {
    
    func fetchAlbum() -> AlbumItem{
        return album
    }
    
    func fetchPhotos() {
    }
}
