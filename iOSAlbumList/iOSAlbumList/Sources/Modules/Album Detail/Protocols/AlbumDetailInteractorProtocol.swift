//
//  AlbumDetailInteractorProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import RxSwift

protocol AlbumDetailInteractorProtocol {
    var interactorToPresenterSubject: PublishSubject<[PhotoItem]>? { get }
    func fetchAlbum() -> AlbumItem
    func fetchPhotos()
}
