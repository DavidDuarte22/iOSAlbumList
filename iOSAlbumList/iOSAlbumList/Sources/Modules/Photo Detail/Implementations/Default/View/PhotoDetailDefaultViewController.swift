//
//  PhotoDetailDefaultViewController.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailDefaultViewController: UIViewController {
    
    var presenter: PhotoDetailPresenterProtocol?
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = presenter?.showPhotoItem().title
        self.photoImage.image = presenter?.showPhotoImage()
    }
}

extension PhotoDetailDefaultViewController: PhotoDetailViewProtocol {

}
