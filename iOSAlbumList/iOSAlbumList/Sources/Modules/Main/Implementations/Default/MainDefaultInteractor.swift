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
    // init http client for get request
    let httpclient = HttpClient.init()
}

extension MainDefaultInteractor: MainInteractorProtocol {
    func fetchAlbums() {
        // fetching albums from web
        self.httpclient.callGet(
            serviceUrl: "https://jsonplaceholder.typicode.com/albums",
            success: {(arrayResult: [AlbumItem], response: HttpResponse?) in
                self.interactorToPresenterSubject?.onNext(arrayResult)}
            ,failure: { (error: Error, response: HttpResponse?) in
                self.interactorToPresenterSubject?.onError(error)}
        )}
    }
