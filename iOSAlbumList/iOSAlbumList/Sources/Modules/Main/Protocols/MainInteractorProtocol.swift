//
//  MainInteractor.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import RxSwift

protocol MainInteractorProtocol {
    // Interactor -> Presenter
    var interactorToPresenterSubject: PublishSubject<[AlbumItem]>? { get }
    // Load Albums from DB
    func fetchAlbums()
}
