//
//  LoginView.swift
//  Cheers
//
//  Created by Do Pham on 6/28/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialActivityIndicator

class LoginView : UIView {
    // MARK: UI Element - Logo
    let logoImage : UIImageView = {
        let logo = UIImageView(image: #imageLiteral(resourceName: "applogo"))
        logo.contentMode = .scaleAspectFill
        logo.layer.cornerRadius = 12.0
        logo.clipsToBounds = true
        return logo
    }()
    
    // MARK: UI Element - Title
    let logoTitle : UILabel = {
        let title = UILabel()
        title.text = "Cheers"
        title.textColor = .white
        title.font = UIFont(name: "HoeflerText-Black", size: 28)
        title.backgroundColor = .clear
        return title
    }()
    
    // MARK: UI Element - Subtitle
    let logoSubTitle : UILabel = {
        let title = UILabel()
        title.text = "The Beer Network"
        title.textColor = .white
        title.font = UIFont(name: "HoeflerText-Regular", size: 18)
        title.backgroundColor = .clear
        return title
    }()
    
    // MARK: UI Element - Email text field
    let emailField : UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        field.borderStyle = .none
        field.backgroundColor = .clear
        field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
        field.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        field.clearButtonMode = .whileEditing
        //remove
        field.text = "do.pham@outlook.com"
        
        return field
    }()
    
    // MARK: UI Element - Email image
    let emailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "mail")
        //            let image = #imageLiteral(resourceName: "un")
        imageView.tintColor = .white
        imageView.image = image
        
        return imageView
    }()
    
    // MARK: UI Element - Password Text field
    let pwField : UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        field.borderStyle = .none
        field.backgroundColor = .clear
        field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
        field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
        field.clearButtonMode = .whileEditing
        field.isSecureTextEntry = true
        field.text = "myfakepassword"
        
        return field
    }()
    
    // MARK: UI Element - Password image
    let pwImage : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "pw")
        imageView.tintColor = .white
        imageView.image = image
        
        return imageView
    }()
    
    // MARK: UI Element - Log in button
    let loginButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Log Me In!", for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        //            button.titleLabel?.font = UIFont.typewrit//americantyp(ofSize: 20)
        button.layer.borderColor = UIColor(r: 255, g: 255, b: 255).cgColor
        button.layer.borderWidth = 4.0
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    // MARK: UI Element - Trouble logging in
    let helpLoginLabel : UILabel = {
        let label = UILabel()
        label.text = "Trouble logging in?"
        label.textColor = .white
        return label
    }()
    
    // MARK: UI Element - Create Account Label
    let createAccountLabel : UILabel = {
        let label = UILabel()
        label.text = "First timer? Make a new account"
        label.textColor = .white
        return label
    }()
    
    // MARK: UI Element - Wrong Sign In Label
    let wrongLoginLabel : UILabel = {
        let label = UILabel()
        label.text = "Login Error"
        label.textColor = .red
        label.font = UIFont(name: "HoeflerText-Black", size: 22)
        label.alpha = 0
        return label
    }()
    
    // MARK: UI Element - Gray Lines
    let grayLine : UIView = {
        let line = UIView()
        line.backgroundColor = .white//UIColor(r: 127, g: 127, b: 127)
        return line
    }()
    
    let grayLine2 : UIView = {
        let line = UIView()
        line.backgroundColor = .white//UIColor(r: 127, g: 127, b: 127)
        return line
    }()
    
}
