//
//  LoginViewController.swift
//  Cheers
//
//  Created by Do Pham on 5/29/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxGesture

class LoginViewController : UIViewController {
    let disposeBag = DisposeBag()
    
    // MARK: Sign in action
    func setSignInButtonAction (_ button : UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        button.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                print("Signing in")
                UIApplication.shared.statusBarStyle = .default
                self.present(TabBarViewController(), animated: true, completion: { () in
                    
                })
                //appDelegate.window!.rootViewController = TabBarViewController()
            }).disposed(by: disposeBag)
    }
    // MARK: Create Account action
    func setCreateAccountAction (_ label : UILabel) {
        label.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                print("Signing in")
                UIApplication.shared.statusBarStyle = .default
                self.present(SignUpViewController(), animated: true, completion: { () in
                    
                })
                //appDelegate.window!.rootViewController = TabBarViewController()
            }).disposed(by: disposeBag)
    }

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
        
        setupLoginContainers(for: self.view)
        
    }
    
    
    
    func setupLoginContainers(for v : UIView){
        
        let topHalf = UIView()
        //        topHalf.backgroundColor = .red
        
        let bottomHalf = UIView()
        //        bottomHalf.backgroundColor = .yellow
        
        //Placeholder for image logo and title
        let logoImage : UIImageView = {
            let logo = UIImageView(image: #imageLiteral(resourceName: "applogo"))
            logo.contentMode = .scaleAspectFill
            logo.layer.cornerRadius = 12.0
            logo.clipsToBounds = true
            return logo
        }()
        // MARK: Logo Title
        let logoTitle : UILabel = {
            let title = UILabel()
            title.text = "Cheers"
            title.textColor = .white
            title.font = UIFont(name: "HoeflerText-Black", size: 28)
            title.backgroundColor = .clear
            return title
        }()
        
        //MARK: Logo subtitle
        let logoSubTitle : UILabel = {
            let title = UILabel()
            title.text = "The Beer Network"
            title.textColor = .white
            title.font = UIFont(name: "HoeflerText-Regular", size: 18)
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
        // Password
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
        
        // MARK: Login button
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
        
        // MARK: Can't login label
        let helpLoginLabel : UILabel = {
            let label = UILabel()
            label.text = "Trouble logging in?"
            label.textColor = .white
            return label
        }()
        
        // MARK: createAccount
        let createAccountLabel : UILabel = {
            let label = UILabel()
            label.text = "First timer? Make a new account"
            label.textColor = .white
            return label
        }()
        
        // MARK: Gray lines
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
        
        let h:Double  = Double(view.bounds.size.height)
        // Add and constraint to superview
        v.addSubview(topHalf)
        topHalf.snp.makeConstraints { (makeTop) in
            makeTop.top.equalTo(v.snp.top)
            makeTop.width.equalTo(v.snp.width)
            // Offset bottom by less than half
            makeTop.bottom.equalTo(v.snp.bottom).offset((h/1.8) * -1)
        }
        
        // MARK: Constrain logo in topHalf
        topHalf.addSubview(logoImage)
        logoImage.snp.makeConstraints {(makeLogo) in
            makeLogo.center.equalTo(topHalf)
            makeLogo.height.width.equalTo(topHalf.snp.height).multipliedBy(0.180)
            //            makeLogo.width.equalTo()
        }
        
        //MARK: Constrain title
        topHalf.addSubview(logoTitle)
        logoTitle.snp.makeConstraints{(makeTitle) in
            makeTitle.centerX.equalTo(logoImage.snp.centerX)
            makeTitle.top.equalTo(logoImage.snp.bottom).offset(10)
        }
        
        //MARK: Constrain subtitle
        topHalf.addSubview(logoSubTitle)
        logoSubTitle.snp.makeConstraints{(makeSubTitle) in
            makeSubTitle.centerX.equalTo(logoImage.snp.centerX)
            makeSubTitle.top.equalTo(logoTitle.snp.bottom).offset(5)
        }
        
        
        v.addSubview(bottomHalf)
        bottomHalf.snp.makeConstraints( {(makeBot) in
            makeBot.top.equalTo(topHalf.snp.bottom)
            makeBot.width.equalTo(v.snp.width)
            makeBot.bottom.equalTo(v.snp.bottom)
        })
        
        // MARK: Email Constraints
        bottomHalf.addSubview(emailField)
        emailField.snp.makeConstraints {(makeEmail) in
            makeEmail.top.equalTo(bottomHalf.snp.top)
            makeEmail.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makeEmail.height.equalTo(45)
            makeEmail.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
        
        bottomHalf.addSubview(emailImage)
        emailImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(emailField.snp.left)
            makeImage.bottom.equalTo(emailField.snp.bottom).offset(-10)
            makeImage.top.equalTo(emailField.snp.top).offset(5)
        }
        
        bottomHalf.addSubview(grayLine)
        grayLine.snp.makeConstraints {(makeLine) in
            makeLine.top.equalTo(emailField.snp.bottom).offset(2)
            makeLine.left.equalTo(emailImage.snp.left)
            makeLine.right.equalTo(emailField.snp.right)
            //makeLine.centerX.equalTo(bottomHalf.snp.centerX)
            makeLine.height.equalTo(0.5)
        }
        
        // MARK: Password Constraints
        bottomHalf.addSubview(pwField)
        pwField.snp.makeConstraints {(makePassword) in
            makePassword.top.equalTo(grayLine.snp.bottom).offset(15)
            makePassword.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makePassword.height.equalTo(45)
            makePassword.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
        
        bottomHalf.addSubview(pwImage)
        pwImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(emailField.snp.left)
            makeImage.bottom.equalTo(pwField.snp.bottom).offset(-10)
            makeImage.top.equalTo(pwField.snp.top).offset(5)
        }
        
        bottomHalf.addSubview(grayLine2)
        grayLine2.snp.makeConstraints {(makeLine2) in
            makeLine2.top.equalTo(pwField.snp.bottom).offset(1)//.offset(5)
            makeLine2.left.equalTo(pwImage.snp.left)
            makeLine2.right.equalTo(pwField.snp.right)
            makeLine2.height.equalTo(0.5)
        }
        
        // MARK: Login button constraint
        bottomHalf.addSubview(loginButton)
        setSignInButtonAction(loginButton)
        loginButton.snp.makeConstraints {(makeButton) in
            makeButton.top.equalTo(grayLine2.snp.bottom).offset(20)
            makeButton.height.equalTo(50)
            makeButton.right.equalTo(pwField.snp.right).offset(-20)
            makeButton.left.equalTo(pwImage.snp.left).offset(20)
        }
        
        
        // MARK: help logging in constraints
        bottomHalf.addSubview(helpLoginLabel)
        helpLoginLabel.snp.makeConstraints {(makeHelp) in
            makeHelp.top.equalTo(loginButton.snp.bottom).offset(15)
            makeHelp.centerX.equalTo(loginButton.snp.centerX)
        }
        
        //MARK: New account constraint
        bottomHalf.addSubview(createAccountLabel)
        setCreateAccountAction(createAccountLabel)
        createAccountLabel.snp.makeConstraints{(makeNewAccLabel) in
            makeNewAccLabel.bottom.equalTo(bottomHalf.snp.bottom).offset(-20)
            makeNewAccLabel.centerX.equalTo(helpLoginLabel.snp.centerX)
        }
        
        
    }
}
