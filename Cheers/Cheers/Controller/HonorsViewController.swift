//
//  HonorsViewController.swift
//  Cheers
//
//  Created by Do Pham on 5/21/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import ALCameraViewController
import MaterialComponents.MaterialButtons
import SnapKit
import RxGesture
import RxSwift


class HonorsViewController : UIViewController {
    var cameraViewController : CameraViewController!
    var viewCollection = CreateCheersLandingView()
    var createButton : MDCFloatingButton!
    let disposeBag = DisposeBag()

        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = cheersBlue//UIColor(r: 0, g: 128, b: 255)

        // Init camera

        
        injectViews()
        assembleViews()
        
    }
    
    func injectViews(){
        createButton = viewCollection.createCheers
        createButton.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                self.cameraViewController = CameraViewController { [weak self] image, asset in
                    // Do something with your image here.
                    self?.dismiss(animated: true, completion: {
                        logService.log(volume: 2, say: "Dismissed camera")
                    })
                }
                self.presentCamera()
            }).disposed(by: disposeBag)
    }
    
    func assembleViews(){
        view.addSubview(createButton)
        createButton.snp.makeConstraints { (makeBtn) in
            makeBtn.center.equalTo(view.snp.center)
            makeBtn.width.height.equalTo(view.snp.width).multipliedBy(0.4)
        }
    }
    
    func presentCamera(){
        present(cameraViewController, animated: true, completion: {logService.log(volume: 2, say: "Presenting camera")})
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
}
