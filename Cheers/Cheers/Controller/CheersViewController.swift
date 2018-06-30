//
//  CheersHomeController.swift
//  Cheers
//
//  Created by Do Pham on 5/21/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MaterialComponents.MDCFloatingButton
import RxGesture
import RxSwift
import ALCameraViewController
import DropDown

class CheersViewController : UIViewController {
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
                    if (image != nil) {
                        // Have a picture, continue
                        self?.dismiss(animated: true, completion: {
                            logService.log(volume: 2, say: "Dismissed camera - presenting basic")
                                let topVC = self?.topMostController()
                                let basicCreate = CreateCheersController()
                                topVC?.present(basicCreate, animated: true, completion: {
                                })
                        })
                    } else {
                        self?.dismiss(animated: true, completion: nil)
                    }



                }
                self.presentCamera()
            }).disposed(by: disposeBag)
    }
    

    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    func assembleViews(){
        view.addSubview(createButton)
        createButton.snp.makeConstraints { (makeBtn) in
            makeBtn.centerX.equalTo(view.snp.centerX)
            makeBtn.centerY.equalTo(view.snp.centerY).multipliedBy(0.9)
            makeBtn.width.height.equalTo(view.snp.width).multipliedBy(0.4)
        }
    }
    
    func presentCamera(){
        present(cameraViewController, animated: true, completion: {logService.log(volume: 2, say: "Presenting camera")})
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
