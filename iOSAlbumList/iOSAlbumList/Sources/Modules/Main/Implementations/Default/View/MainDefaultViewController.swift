//
//  MainDefaultView.swift
//  iOSAlbumList
//
//  Created by David Duarte on 05/05/2019.
//  Copyright © 2019 David Duarte. All rights reserved.
//

import UIKit
import RxSwift

class MainDefaultViewController: UIViewController {
    
    var presenter: MainPresenterProtocol?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        subscribeToObserver((self.presenter?.presenterToViewSubject)!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func subscribeToObserver (_ subject: PublishSubject<[AlbumItem]>) {
        subject.subscribe(
            onNext: {(albums) in
                
        },
            onError: {(error) in
                print(error)
        }).disposed(by: disposeBag)
    }
}


extension MainDefaultViewController: MainViewProtocol {
    func showAlbums(_ albums: [AlbumItem]) {
    }
    
    func showErrorMessage(_ message: String) {
    }
}
