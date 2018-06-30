//
//  CreateCheersLandingView.swift
//  Cheers
//
//  Created by Do Pham on 6/30/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialButtons

class CreateCheersLandingView : UIView {
    let createCheers : MDCFloatingButton = {
        let plusImage = UIImage(named: "main_icon")
        let button = MDCFloatingButton()
        button.backgroundColor = UIColor(r: 107, g: 166, b: 255)
        //rgb(145,188,255)
        button.setImage(plusImage, for: .normal)
        button.imageView?.contentMode = UIViewContentMode.scaleToFill
//        MDCFloatingActionButtonThemer.applyScheme(buttonScheme, to: button)
        return button
    }()
}
