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
    
    let hoppyLabel : UILabel = {
        let label = UILabel()
        label.text = "Hoppiness (Bitter): 0/100"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textColor = cheersOrange
        return label
    }()
    
    let hoppySlider : MDCSlider = {
        let slider = MDCSlider()
        slider.trackBackgroundColor = lightCheersBlue;
        slider.color = cheersOrange
        return slider
    }()
    
    let crispyLabel : UILabel = {
        let label = UILabel()
        label.text = "Crispness (Clean): 0/100"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textColor = cheersOrange
        return label
    }()
    
    let crispySlider : MDCSlider = {
        let slider = MDCSlider()
        slider.trackBackgroundColor = lightCheersBlue;
        slider.color = cheersOrange
        return slider
    }()
    
    let maltyLabel : UILabel = {
        let label = UILabel()
        label.text = "Maltiness (Salty/Sweet): 0/100"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textColor = cheersOrange
        return label
    }()
    
    let maltySlider : MDCSlider = {
        let slider = MDCSlider()
        slider.trackBackgroundColor = lightCheersBlue;
        slider.color = cheersOrange
        return slider
    }()
    
    let darkLabel : UILabel = {
        let label = UILabel()
        label.text = "Darkness (Roasty): 0/100"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textColor = cheersOrange
        return label
    }()
    
    let darkSlider : MDCSlider = {
        let slider = MDCSlider()
        slider.trackBackgroundColor = lightCheersBlue;
        slider.color = cheersOrange
        return slider
    }()
    
    let tartLabel : UILabel = {
        let label = UILabel()
        label.text = "Tartness (Fruity/Sour): 0/100"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textColor = cheersOrange
        return label
    }()
    
    let tartSlider : MDCSlider = {
        let slider = MDCSlider()
        slider.trackBackgroundColor = lightCheersBlue;
        slider.color = cheersOrange
        return slider
    }()
    
    let discardButton : MDCFloatingButton = {
        let xImage = UIImage(named: "cancel")
        let button = MDCFloatingButton()
        button.backgroundColor = cheersBlue
        //rgb(145,188,255)
        button.setImage(xImage, for: .normal)
        button.imageView?.contentMode = UIViewContentMode.scaleToFill
        button.setElevation(ShadowElevation(rawValue: 0), for: .normal)
        button.setElevation(ShadowElevation(rawValue: 2), for: .highlighted)
        return button
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
