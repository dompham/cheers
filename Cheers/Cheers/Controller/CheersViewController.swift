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
    let viewElements = CreateCheersBasicView()
    var segmentBar : MDCTabBar!
    var container : UIView!
    
    var beerField : MDCTextField!
    var beerFieldController = MDCTextInputControllerOutlined()
    var styleField : MDCTextField!
    var beerStyleController = MDCTextInputControllerOutlined()
    
    var slider1 : MDCSlider!
    var logoImage : UIImageView!
    var typeSelect : DropDown!
    
    override func viewDidLoad() {
        view.backgroundColor = cheersBlue//UIColor(r: 0, g: 128, b: 255)
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setViews()
        assembleViews()
    }
    
    func setupSlider1(){
        slider1 = MDCSlider(frame: CGRect(x: 50, y: 50, width: 100, height: 27))
        slider1.addTarget(self,
                         action: #selector(didChangeSliderValue(senderSlider:)),
                         for: .valueChanged)
        container.addSubview(slider1)
    }
    
    @objc func didChangeSliderValue(senderSlider:MDCSlider) {
        print("Did change slider value to: %@", senderSlider.value)
    }
    
    
    func setViews(){
        setupSegmentBar()
        
        container = viewElements.container1
        view.addSubview(container)
        
        logoImage = viewElements.logoImage
        container.addSubview(logoImage)
        
        beerField = viewElements.beerField
        container.addSubview(beerField)
        
        styleField = viewElements.styleField
        container.addSubview(styleField)
        
        //Setup controllers for the MDC classes that need it
        setupMDCControllers()
        
        setupSlider1()

        typeSelect = viewElements.typeSelect
        typeSelect.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.styleField.text = item
        }
        view.addSubview(typeSelect)
        
    }
    
    func assembleViews(){
        
        container.snp.makeConstraints({ (makeContainer) in
            makeContainer.top.equalTo((segmentBar.snp.bottom)).offset(20)
            makeContainer.width.equalTo(view.snp.width)
            makeContainer.centerX.equalTo(view.snp.centerX)
            makeContainer.height.equalTo(view.snp.height)
        })
        
        // MARK: Constraints - Lower Container
        logoImage.snp.makeConstraints {(makeLogo) in
            makeLogo.top.equalTo((container.snp.top)).offset(15)
            makeLogo.centerX.equalTo(view.snp.centerX)
            makeLogo.height.width.equalTo(view.snp.height).multipliedBy(0.075)
        }
        
        beerField.snp.makeConstraints { (makeBeer) in
            makeBeer.top.equalTo(logoImage.snp.bottom).offset(50)
            makeBeer.centerX.equalTo(view.snp.centerX)
            makeBeer.width.equalTo(view.snp.width).multipliedBy(0.7)
        }
        
        styleField.snp.makeConstraints { (makeStyle) in
            makeStyle.top.equalTo(beerField.snp.bottom).offset(15)
            makeStyle.centerX.equalTo(view.snp.centerX)
            makeStyle.width.equalTo(view.snp.width).multipliedBy(0.7)
        }
        
        typeSelect.anchorView = styleField
        typeSelect.bottomOffset = CGPoint(x: 0, y: -(typeSelect.anchorView?.plainView.bounds.height)!)
    }

    override func viewDidLayoutSubviews() {
        typeSelect.width = (container.frame.size.width) * 0.7
    }
    
    func setupSegmentBar(){
        let midX = view.bounds.midX
        let midY = view.bounds.midY
        segmentBar = MDCTabBar(frame: CGRect(origin: CGPoint(x: (midX * 0.3), y: midY * 0.01), size: CGSize(width: view.bounds.width, height: 20.0)))
        segmentBar.items = [
            UITabBarItem(title: "Basic", image: UIImage(named: ""), tag: 0),
            UITabBarItem(title: "Comments", image: UIImage(named: ""), tag: 0),
            UITabBarItem(title: "Preview", image: UIImage(named: ""), tag: 0)
        ]
        segmentBar.itemAppearance = .titledImages
        segmentBar.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        segmentBar.sizeToFit()
        segmentBar.inkColor = .clear
        segmentBar.tintColor = cheersOrange
        view.addSubview(segmentBar)
    }
    
    func setupMDCControllers(){
        // MARK: Beer MDC controllers
        beerFieldController = MDCTextInputControllerOutlined(textInput: beerField) //
        beerFieldController.normalColor = tintCheersOrange
        beerFieldController.activeColor = tintCheersOrange
        beerFieldController.floatingPlaceholderNormalColor = tintCheersOrange
        beerFieldController.floatingPlaceholderActiveColor = tintCheersOrange
        beerFieldController.inlinePlaceholderColor = tintCheersOrange
        
        beerStyleController = MDCTextInputControllerOutlined(textInput: styleField)
        beerStyleController.normalColor = tintCheersOrange
        beerStyleController.activeColor = tintCheersOrange
        beerStyleController.floatingPlaceholderNormalColor = tintCheersOrange
        beerStyleController.floatingPlaceholderActiveColor = tintCheersOrange
        beerStyleController.inlinePlaceholderColor = tintCheersOrange
        
        styleField.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                print("show dropdown")
                self.styleField.endEditing(true)
                self.typeSelect.show()
            }).disposed(by: disposeBag)
    }

    
    
}
