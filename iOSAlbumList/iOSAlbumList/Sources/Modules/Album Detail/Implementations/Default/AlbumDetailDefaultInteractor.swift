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
    // return album when presenter ask for it
    func fetchAlbum() -> AlbumItem{
        return album
    }
    
    func fetchPhotos() {
        // fetching photos from web of the album selected and got it by init
        self.httpclient.callGet(
            serviceUrl: "https://jsonplaceholder.typicode.com/photos",
            parameters: ["albumId":album.albumId],
            success: {(arrayResult: [PhotoItem], response: HttpResponse?) in
                    self.interactorToPresenterSubject?.onNext(arrayResult)}
            ,failure: { (error: Error, response: HttpResponse?) in
                self.interactorToPresenterSubject?.onError(error)}
        )
    }
}
