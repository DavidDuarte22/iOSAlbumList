//
//  MainDefaultPresenter.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import RxSwift

class MainDefaultPresenter {
    
    var router: MainRouterProtocol?
    var interactor: MainInteractorProtocol?
    
    // Presenter -> View
    var presenterToViewSubject: PublishSubject<[AlbumItem]>?
    let disposeBag = DisposeBag()
    
    init() {
        self.presenterToViewSubject = PublishSubject<[AlbumItem]>()
    }
}


extension MainDefaultPresenter: MainPresenterProtocol {
    func showAlbums() {
        
    }
    
    func showAlbumDetail(_ view: MainViewProtocol, _ album: AlbumItem) {
        
    }
    
}
