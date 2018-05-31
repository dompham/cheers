//
//  SignUpViewController.swift
//  Cheers
//
//  Created by Do Pham on 5/30/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import RxGesture
import RxSwift
import SnapKit

class SignUpViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set to light because of dark BG
        UIApplication.shared.statusBarStyle = .lightContent
        
        // screen width and height:
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "loginTaps.pdf")
        imageViewBackground.contentMode = .scaleAspectFit
        view.addSubview(imageViewBackground)
        view.sendSubview(toBack: imageViewBackground)
        
        initViews(for: self.view)
        
    }
    func initViews(for view : UIView) {
        
        // MARK: Title
        let titleLabel : UILabel = {
            let title = UILabel()
            title.text = "Create an account"
            title.textColor = .white
            title.font = UIFont(name: "HoeflerText-Black", size: 28)
            title.backgroundColor = .clear
            return title
        }()
        
        // MARK: Email view setups
        // Email field
        let emailField : UITextField = {
            let field = UITextField()
            
            field.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
            field.borderStyle = .none
            field.backgroundColor = .clear
            field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
            field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
            field.clearButtonMode = .whileEditing
            
            return field
        }()
        //Email image
        let emailImage : UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            imageView.contentMode = .scaleAspectFit
            let image = #imageLiteral(resourceName: "un")
            imageView.tintColor = .white
            imageView.image = image
            
            return imageView
        }()
        
        
        // MARK: Password view setup
        let pwField : UITextField = {
            let field = UITextField()
            
            field.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
            field.borderStyle = .none
            field.backgroundColor = .clear
            field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
            field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
            field.clearButtonMode = .whileEditing
            field.isSecureTextEntry = true
            
            return field
        }()
        //pw image
        let pwImage : UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            imageView.contentMode = .scaleAspectFit
            let image = #imageLiteral(resourceName: "pw")
            imageView.tintColor = .white
            imageView.image = image
            
            return imageView
        }()
        
        // MARK: Password confirm view setup
        let pwConfirmField : UITextField = {
            let field = UITextField()
            
            field.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
            field.borderStyle = .none
            field.backgroundColor = .clear
            field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
            field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
            field.clearButtonMode = .whileEditing
            field.isSecureTextEntry = true
            
            return field
        }()
        //pw image
        let pwImage2 : UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            imageView.contentMode = .scaleAspectFit
            let image = #imageLiteral(resourceName: "pw")
            imageView.tintColor = .white
            imageView.image = image
            
            return imageView
        }()
        
        // MARK: Create button
        let createButton : UIButton = {
            let button = UIButton()
            button.backgroundColor = .clear
            button.setTitle("Cheers!!", for: .normal)
            button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
            //            button.titleLabel?.font = UIFont.typewrit//americantyp(ofSize: 20)
            button.layer.borderColor = UIColor(r: 255, g: 255, b: 255).cgColor
            button.layer.borderWidth = 4.0
            button.layer.cornerRadius = 8.0
            return button
        }()
        
        // MARK: Adding views
        // TODO: Missing title
        view.addSubview(titleLabel)
//        view.addSubview(emailField)
//        view.addSubview(emailImage)
//        view.addSubview(pwField)
//        view.addSubview(pwImage)
//        view.addSubview(pwConfirmField)
//        view.addSubview(pwImage2)
//        view.addSubview(createButton)

        // MARK: Constraints Title
        titleLabel.snp.makeConstraints {(makeTitle) in
            makeTitle.centerX.equalTo(view.snp.centerX)
            makeTitle.centerY.equalTo(view.snp.centerY).multipliedBy(0.35)
        }

    }
}
