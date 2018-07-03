//
//  CheersView.swift
//  Cheers
//
//  Created by Do Pham on 6/21/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import DropDown
import MaterialComponents

class CreateCheersBasicView : UIView {
    // MARK: UI Element - Segment Container
    let container1 : UIView = {
       let container = UIView()
        container.backgroundColor = cheersBlue
        return container
    }()
    
    // MARK: UI Element - Logo
    let logoImage : UIImageView = {
        let logo = UIImageView(image: #imageLiteral(resourceName: "main_icon"))
        logo.contentMode = .scaleAspectFill
        logo.layer.cornerRadius = 12.0
        logo.clipsToBounds = true
        return logo
    }()


    // MARK: UI Element - Beer name
    let beerField : MDCTextField = {
        let field = MDCTextField()
        field.placeholder = "Beer Name"
        field.textColor = tintCheersOrange
        field.cursorColor = tintCheersOrange
        return field
    }()
    
    let styleField : MDCTextField = {
        let styleField = MDCTextField()
        styleField.placeholder = "Beer Style"
        styleField.textColor = tintCheersOrange
        styleField.cursorColor = tintCheersOrange
        return styleField
    }()
    
    // MARK: UI Element - Gray Lines
    let orangeSeparator : UIView = {
        let line = UIView()
        line.backgroundColor = cheersOrange
        return line
    }()
    
    // MARK: UI Element - Beer name
    let typeSelect : DropDown = {
        let select = DropDown()
        
        select.dataSource = ["Amber / Red Ale",
                             "Barleywine",
                             "Black & Tan",
                             "Black Ale",
                             "Blonde Ale",
                             "Brown Ale",
                             "Chile Beer",
                             "Cream Ale",
                             "Dark Wheat Ale",
                             "Double / Imperial IPA",
                             "Double / Imperial Pilsner",
                             "Double / Imperial Stout",
                             "IPA",
                             "Light Lager",
                             "Low Alcohol Beer",
                             "Malt Liquor",
                             "Pale Ale (APA)",
                             "Pale Lager",
                             "Pale Wheat Ale",
                             "Porter",
                             "Pumpkin Ale",
                             "Red Lager",
                             "Rye Beer",
                             "Stout",
                             "Strong Ale",
                             "Wheatwine",
                             "Wild Ale"]
        select.direction = .bottom

        return select
    }()
    
    
}
