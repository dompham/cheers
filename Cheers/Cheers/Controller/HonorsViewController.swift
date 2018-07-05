//
//  CreateCheersController.swift
//  Cheers
//
//  Created by Do Pham on 6/30/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MaterialComponents
import RxGesture
import RxSwift
import DropDown
class HonorsViewController : UIViewController, MDCTabBarDelegate {
//    let disposeBag = DisposeBag()
//    let viewElements = CreateCheersBasicView()
//    var segmentBar : MDCTabBar!
//    var container : UIView!
//
//    var beerField : MDCTextField!
//    var beerFieldController = MDCTextInputControllerOutlined()
//    var styleField : MDCTextField!
//    var beerStyleController = MDCTextInputControllerOutlined()
//
//    var hoppyLabel : UILabel!
//    var hoppySlider : MDCSlider!
//    var crispyLabel : UILabel!
//    var crispySlider : MDCSlider!
//    var maltyLabel : UILabel!
//    var maltySlider : MDCSlider!
//    var darkLabel : UILabel!
//    var darkSlider : MDCSlider!
//    var tartLabel : UILabel!
//    var tartSlider : MDCSlider!
//
//    var discardButton : MDCFloatingButton!
//    var logoImage : UIImageView!
//    var typeSelect : DropDown!
//
//    override func viewDidLoad() {
//        view.backgroundColor = cheersBlue//UIColor(r: 0, g: 128, b: 255)
//        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
//        // Dont show
////        self.tabBarController?.tabBar.isHidden = true
//
//        injectViews()
//        assembleViews()
//    }
//
//    @objc func didChangeHoppySliderValue(senderSlider:MDCSlider) {
//        print("Did change slider value to: %d", senderSlider.value)
//        let val = senderSlider.value * 100
//        self.hoppyLabel.text = "Hoppiness (Bitter): \(Int(val))/100"
//    }
//
//    func injectViews(){
//        setupSegmentBar()
//
//        container = viewElements.container1
//        logoImage = viewElements.logoImage
//        beerField = viewElements.beerField
//        styleField = viewElements.styleField
//        hoppyLabel = viewElements.hoppyLabel
//        hoppySlider = viewElements.hoppySlider
//        crispyLabel = viewElements.crispyLabel
//        crispySlider = viewElements.crispySlider
//        maltyLabel = viewElements.maltyLabel
//        maltySlider = viewElements.maltySlider
//        darkLabel = viewElements.darkLabel
//        darkSlider = viewElements.darkSlider
//        tartLabel = viewElements.tartLabel
//        tartSlider = viewElements.tartSlider
//
//        discardButton = viewElements.discardButton
//        //Setup controllers for the MDC classes that need it
//        setupMDCControllers()
//
//
//        typeSelect = viewElements.typeSelect
//        typeSelect.selectionAction = {
//            [unowned self] (index: Int, item: String) in
//            self.styleField.text = item
//        }
//
//    }
//
//    func assembleViews(){
//        view.addSubview(container)
//        container.addSubview(logoImage)
//        container.addSubview(beerField)
//        container.addSubview(styleField)
//        view.addSubview(typeSelect)
//        container.addSubview(hoppyLabel)
//        container.addSubview(hoppySlider)
//        container.addSubview(crispyLabel)
//        container.addSubview(crispySlider)
//        container.addSubview(maltyLabel)
//        container.addSubview(maltySlider)
//        container.addSubview(darkLabel)
//        container.addSubview(darkSlider)
//        container.addSubview(tartLabel)
//        container.addSubview(tartSlider)
//        var discardContainer = UIView()
////        discardContainer.backgroundColor = .white
//        container.addSubview(discardContainer)
//        discardContainer.addSubview(discardButton)
//
//        container.snp.makeConstraints({ (makeContainer) in
//            makeContainer.top.equalTo((segmentBar.snp.bottom)).offset(20)
//            makeContainer.width.equalTo(view.snp.width)
//            makeContainer.centerX.equalTo(view.snp.centerX)
//            makeContainer.height.equalTo(view.snp.height)
//        })
//
//        // MARK: Constraints - Lower Container
//        logoImage.snp.makeConstraints {(makeLogo) in
//            makeLogo.top.equalTo((container.snp.top)).offset(15)
//            makeLogo.centerX.equalTo(view.snp.centerX)
//            makeLogo.height.width.equalTo(view.snp.height).multipliedBy(0.075)
//        }
//
//        beerField.snp.makeConstraints { (makeBeer) in
//            makeBeer.top.equalTo(logoImage.snp.bottom).offset(25)
//            makeBeer.centerX.equalTo(view.snp.centerX)
//            makeBeer.width.equalTo(view.snp.width).multipliedBy(0.7)
//        }
//
//        styleField.snp.makeConstraints { (makeStyle) in
//            makeStyle.top.equalTo(beerField.snp.bottom).offset(3)
//            makeStyle.centerX.equalTo(view.snp.centerX)
//            makeStyle.width.equalTo(view.snp.width).multipliedBy(0.7)
//        }
//
//        typeSelect.anchorView = styleField
//        typeSelect.bottomOffset = CGPoint(x: 0, y: -(typeSelect.anchorView?.plainView.bounds.height)!)
//
//        hoppyLabel.snp.makeConstraints { (makeLabel) in
//            makeLabel.top.equalTo(styleField.snp.bottom).offset(10)
//            makeLabel.left.equalTo(styleField.snp.left).offset(3)
//        }
//
//        hoppySlider.snp.makeConstraints { (makeSlider) in
//            makeSlider.top.equalTo(hoppyLabel.snp.bottom)
//            makeSlider.centerX.equalTo(view.snp.centerX)
//            makeSlider.width.equalTo(styleField.snp.width)
//        }
//
//        crispyLabel.snp.makeConstraints { (makeLabel) in
//            makeLabel.top.equalTo(hoppySlider.snp.bottom).offset(5)
//            makeLabel.left.equalTo(styleField.snp.left).offset(3)
//        }
//
//        crispySlider.snp.makeConstraints { (makeSlider) in
//            makeSlider.top.equalTo(crispyLabel.snp.bottom)
//            makeSlider.centerX.equalTo(view.snp.centerX)
//            makeSlider.width.equalTo(styleField.snp.width)
//        }
//
//        maltyLabel.snp.makeConstraints { (makeLabel) in
//            makeLabel.top.equalTo(crispySlider.snp.bottom).offset(5)
//            makeLabel.left.equalTo(styleField.snp.left).offset(3)
//        }
//
//        maltySlider.snp.makeConstraints { (makeSlider) in
//            makeSlider.top.equalTo(maltyLabel.snp.bottom)
//            makeSlider.centerX.equalTo(view.snp.centerX)
//            makeSlider.width.equalTo(styleField.snp.width)
//        }
//
//        darkLabel.snp.makeConstraints { (makeLabel) in
//            makeLabel.top.equalTo(maltySlider.snp.bottom).offset(5)
//            makeLabel.left.equalTo(styleField.snp.left).offset(3)
//        }
//
//        darkSlider.snp.makeConstraints { (makeSlider) in
//            makeSlider.top.equalTo(darkLabel.snp.bottom)
//            makeSlider.centerX.equalTo(view.snp.centerX)
//            makeSlider.width.equalTo(styleField.snp.width)
//        }
//
//        tartLabel.snp.makeConstraints { (makeLabel) in
//            makeLabel.top.equalTo(darkSlider.snp.bottom).offset(5)
//            makeLabel.left.equalTo(styleField.snp.left).offset(3)
//        }
//
//        tartSlider.snp.makeConstraints { (makeSlider) in
//            makeSlider.top.equalTo(tartLabel.snp.bottom)
//            makeSlider.centerX.equalTo(view.snp.centerX)
//            makeSlider.width.equalTo(styleField.snp.width)
//        }
//
//        discardContainer.snp.makeConstraints { (makeContainer) in
//            makeContainer.top.equalTo(tartSlider.snp.bottom)
//            makeContainer.bottom.equalTo(view.snp.bottom)
//            makeContainer.width.equalTo(styleField.snp.width)
//            makeContainer.centerX.equalTo(styleField.snp.centerX)
//        }
//
//        discardButton.snp.makeConstraints { (makeBtn) in
//            makeBtn.center.equalTo(discardContainer.snp.center)
//            makeBtn.width.height.equalTo(35)
//        }
//    }
//
//    override func viewDidLayoutSubviews() {
//        typeSelect.width = (container.frame.size.width) * 0.7
//    }
//
//    func setupSegmentBar(){
//        let midX = view.bounds.midX
//        let midY = view.bounds.midY
//        segmentBar = MDCTabBar(frame: CGRect(origin: CGPoint(x: (midX * 0.3), y: midY * 0.01), size: CGSize(width: view.bounds.width, height: 20.0)))
//        segmentBar.items = [
//            UITabBarItem(title: "Basic", image: nil, tag: 0),
//            UITabBarItem(title: "Comments", image: nil, tag: 0),
//            UITabBarItem(title: "Submit", image: nil, tag: 0),
//        ]
//        segmentBar.itemAppearance = .titledImages
//        segmentBar.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
//        segmentBar.sizeToFit()
//        segmentBar.inkColor = .clear
//        segmentBar.tintColor = cheersOrange
//        view.addSubview(segmentBar)
//    }
//
//    func setupMDCControllers(){
//        // MARK: Beer MDC controllers
//        beerFieldController = MDCTextInputControllerOutlined(textInput: beerField) //
//        beerFieldController.normalColor = tintCheersOrange
//        beerFieldController.activeColor = tintCheersOrange
//        beerFieldController.floatingPlaceholderNormalColor = tintCheersOrange
//        beerFieldController.floatingPlaceholderActiveColor = tintCheersOrange
//        beerFieldController.inlinePlaceholderColor = tintCheersOrange
//
//        beerStyleController = MDCTextInputControllerOutlined(textInput: styleField)
//        beerStyleController.normalColor = tintCheersOrange
//        beerStyleController.activeColor = tintCheersOrange
//        beerStyleController.floatingPlaceholderNormalColor = tintCheersOrange
//        beerStyleController.floatingPlaceholderActiveColor = tintCheersOrange
//        beerStyleController.inlinePlaceholderColor = tintCheersOrange
//
//        styleField.rx.tapGesture()
//            .when(.recognized)
//            .subscribe(onNext: { _ in
//                print("show dropdown")
//                self.styleField.endEditing(true)
//                self.typeSelect.show()
//            }).disposed(by: disposeBag)
//
//        hoppySlider.addTarget(self,
//                              action: #selector(didChangeHoppySliderValue(senderSlider:)),
//                              for: .valueChanged)
//    }
//
//
    
}
