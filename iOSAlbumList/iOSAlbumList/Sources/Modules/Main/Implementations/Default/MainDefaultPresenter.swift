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
    // init of observer
    init() {
        self.presenterToViewSubject = PublishSubject<[AlbumItem]>()
    }
}


extension MainDefaultPresenter: MainPresenterProtocol {
    func showAlbums() {
        // asking albums to interactor
        interactor?.fetchAlbums()
        let subscription = self.interactor?.interactorToPresenterSubject?.subscribe(
            onNext: {(albums) in
                self.presenterToViewSubject?.onNext(albums)
        },
            onError: {(error) in
                self.presenterToViewSubject?.onError(error)
        })
        subscription?.disposed(by: disposeBag)
    }
    
    func showAlbumDetail(_ view: MainViewProtocol, _ album: AlbumItem) {
        // route to album detail module
    }
    
}
