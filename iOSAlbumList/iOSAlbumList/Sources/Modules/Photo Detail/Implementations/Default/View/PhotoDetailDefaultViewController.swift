//
//  PhotoDetailDefaultView.swift
//  PhotoDetail
//
//  Created by David Duarte on 3/5/19.
//

import Foundation
import UIKit

class PhotoDetailDefaultViewController: UIViewController {
    
    var presenter: PhotoDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PhotoDetailDefaultViewController: PhotoDetailViewProtocol {

}
