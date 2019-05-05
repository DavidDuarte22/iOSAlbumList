//
//  MainDefaultInteractor.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import RxSwift

class MainDefaultInteractor {
    var interactorToPresenterSubject: PublishSubject<[AlbumItem]>?
    
    init() {
        self.interactorToPresenterSubject = PublishSubject<[AlbumItem]>()
    }
    
}

extension MainDefaultInteractor: MainInteractorProtocol {
    func fetchAlbums() {
       
    }
}
