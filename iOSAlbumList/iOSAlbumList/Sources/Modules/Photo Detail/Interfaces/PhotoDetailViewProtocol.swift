//
//  PhotoDetailViewProtocol.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoDetailViewProtocol: class {
    var presenter: PhotoDetailPresenterProtocol? { get set }
}
