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
import MaterialComponents

class CheersViewController : UIViewController {
    let viewElements = CheersView()
    var beerField : UITextField?
    var logoImage : UIImageView?
    var separator : UIView?
    
    override func viewDidLoad() {
        view.backgroundColor = cheersBlue//UIColor(r: 0, g: 128, b: 255)
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        setViews()
        assembleViews()
    }

    func setViews(){
        logoImage = viewElements.logoImage
        view.addSubview(logoImage!)
        
        beerField = viewElements.beerField
        view.addSubview(beerField!)

        separator = viewElements.orangeSeparator
        view.addSubview(separator!)

    }

    func assembleViews(){
        // MARK: Constraints - Lower Container
        logoImage?.snp.makeConstraints {(makeLogo) in
            makeLogo.centerX.equalTo(view.snp.centerX)
            makeLogo.centerY.equalTo(view.snp.centerY).multipliedBy(0.35)
            makeLogo.height.width.equalTo(view.snp.height).multipliedBy(0.075)
        }
        
        beerField?.snp.makeConstraints { (makeBeer) in
            makeBeer.top.equalTo(logoImage!.snp.bottom).offset(50)
            makeBeer.centerX.equalTo(view.snp.centerX)
            makeBeer.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        // MARK: Constraints - Gray Line 1
        separator?.snp.makeConstraints {(makeLine) in
            makeLine.top.equalTo(beerField!.snp.bottom).offset(10)
            makeLine.left.equalTo(beerField!.snp.left).offset(-20)
            makeLine.right.equalTo(beerField!.snp.right).offset(20)
            makeLine.height.equalTo(1)
        }
    }
    
    
}
