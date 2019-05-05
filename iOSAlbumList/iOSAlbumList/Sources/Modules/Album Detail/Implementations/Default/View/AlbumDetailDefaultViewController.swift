//
//  HomeDefaultView.swift
//  Home
//
//  Created by David Duarte on 29/4/19.
//

import Foundation
import UIKit
import RxSwift

class AlbumDetailDefaultViewController: UIViewController {
    
    var presenter: AlbumDetailPresenterProtocol?
    
    let disposeBag = DisposeBag()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        subscribeToObserver((self.presenter?.presenterToViewSubject)!)
        
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        
    }
    
    func subscribeToObserver (_ subject: PublishSubject<[PhotoItem]>) {
        subject.subscribe(
            onNext: {(photos) in
        },
            onError: {(error) in
                print(error)
        }).disposed(by: disposeBag)
    }
}

extension AlbumDetailDefaultViewController: AlbumDetailViewProtocol {
    
    

}
