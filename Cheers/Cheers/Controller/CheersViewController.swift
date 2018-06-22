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
import RxGesture
import RxSwift
import DropDown

class CheersViewController : UIViewController, MDCTabBarDelegate {
    let disposeBag = DisposeBag()
    let viewElements = CheersView()
    var beerFieldController = MDCTextInputControllerUnderline()
    var segmentBar : MDCTabBar?
    var container : UIView?
    var  beerField : MDCMultilineTextField?

    var logoImage : UIImageView?
    var separator : UIView?
    var typeSelect : DropDown?
    
    override func viewDidLoad() {
        view.backgroundColor = cheersBlue//UIColor(r: 0, g: 128, b: 255)
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        setViews()
        setupSegmentBar()
        
        assembleViews()
    }
    func setupSegmentBar(){
        let midX = view.bounds.midX
        let midY = view.bounds.midY
        segmentBar = MDCTabBar(frame: CGRect(origin: CGPoint(x: (midX * 0.3), y: midY * 0.01), size: CGSize(width: view.bounds.width, height: 20.0)))
        segmentBar?.items = [
            UITabBarItem(title: "Basic", image: UIImage(named: ""), tag: 0),
            UITabBarItem(title: "Comments", image: UIImage(named: ""), tag: 0),
            UITabBarItem(title: "Preview", image: UIImage(named: ""), tag: 0)
        ]
        segmentBar?.itemAppearance = .titledImages
        segmentBar?.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        segmentBar?.sizeToFit()
        segmentBar?.inkColor = .clear
        segmentBar?.tintColor = cheersOrange
        view.addSubview(segmentBar!)

        //segmentBar?.frame.origin = view.center
    }
    
    func setupBeerField(){
        beerField = MDCMultilineTextField()
        beerField?.placeholder = "Beer Name"
        //        textFieldFloating.textView?.delegate = self
        beerFieldController = MDCTextInputControllerUnderline(textInput: beerField) // Hold on as a property
        container?.addSubview(beerField!)
    }
    
    func setViews(){
        
        container = viewElements.container1
        view.addSubview(container!)
        logoImage = viewElements.logoImage
        container?.addSubview(logoImage!)
        
        setupBeerField()
        
        separator = viewElements.orangeSeparator
//        view.addSubview(separator!)
        separator!.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                print("show dropdown")
                self.typeSelect?.show()
            }).disposed(by: disposeBag)
        
        typeSelect = viewElements.typeSelect
//        view.addSubview(typeSelect!)
        
    }
    
    func assembleViews(){
        
        container?.snp.makeConstraints({ (makeContainer) in
            makeContainer.top.equalTo((segmentBar?.snp.bottom)!).offset(20)
            makeContainer.width.equalTo(view.snp.width)
            makeContainer.centerX.equalTo(view.snp.centerX)
            makeContainer.height.equalTo(view.snp.height)
        })
        
        // MARK: Constraints - Lower Container
        logoImage?.snp.makeConstraints {(makeLogo) in
            makeLogo.top.equalTo((container?.snp.top)!).offset(15)
            makeLogo.centerX.equalTo(view.snp.centerX)
            makeLogo.height.width.equalTo(view.snp.height).multipliedBy(0.075)
        }
        
        
        
        

        beerField?.snp.makeConstraints { (makeBeer) in
            makeBeer.top.equalTo(logoImage!.snp.bottom).offset(50)
            makeBeer.centerX.equalTo(view.snp.centerX)
            makeBeer.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
//
//        // MARK: Constraints - Gray Line 1
//        separator?.snp.makeConstraints {(makeLine) in
//            makeLine.top.equalTo(beerField!.snp.bottom).offset(10)
//            makeLine.left.equalTo(beerField!.snp.left).offset(-20)
//            makeLine.right.equalTo(beerField!.snp.right).offset(20)
//            makeLine.height.equalTo(1)
//        }
//
//        typeSelect?.anchorView = separator
    }
    
    
}
