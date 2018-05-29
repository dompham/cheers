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

class CheersViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupLoginContainers(for: self.view)
        setupContentsTopHalf()
        setupContentsBottomHalf()
    }
    
    func setupLoginContainers(for v : UIView){
        
        let topHalf = UIView()
        topHalf.backgroundColor = .red
        
        let bottomHalf = UIView()
        bottomHalf.backgroundColor = .yellow
        
        //Placeholder for image logo and title
        let logoTitle : UILabel = {
            let title = UILabel()
            title.text = "Logo \n Title Title Title Title Title"
            title.lineBreakMode = .byWordWrapping
            title.numberOfLines = 2
            title.font = UIFont.boldSystemFont(ofSize: 24)
            title.backgroundColor = .white
            return title
        }()
        
        // Email field
        let emailField : UITextField = {
            let field = UITextField()
            field.placeholder = "Email"
            field.borderStyle = .none
            field.backgroundColor = .clear
            field.textColor = UIColor(r: 127, g: 127, b: 127)
            field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
            field.clearButtonMode = .whileEditing
            
            //Left image
//            field.leftViewMode = UITextFieldViewMode.always
//            field.leftViewMode = .always
//
//            let imageView = UIImageView()
//            imageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
//            let image = #imageLiteral(resourceName: "profileGray")
//            imageView.image = image
//            field.leftView = imageView
            return field
        }()
        
        //Email image
        let emailImage : UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            imageView.contentMode = .scaleAspectFit

            let image = #imageLiteral(resourceName: "un")
            imageView.image = image
            
            return imageView
        }()
        
        // Password
        let pwField : UITextField = {
            let field = UITextField()
            field.placeholder = "Password"
            field.borderStyle = .none
            field.backgroundColor = .clear
            field.textColor = UIColor(r: 127, g: 127, b: 127)
            field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
            field.clearButtonMode = .whileEditing
            field.isSecureTextEntry = true

            return field
        }()
        
        //Email image
        let pwImage : UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            imageView.contentMode = .scaleAspectFit
            let image = #imageLiteral(resourceName: "pw")
            imageView.image = image
            
            return imageView
        }()
        
        // Gray lines
        let grayLine : UIView = {
            let line = UIView()
            line.backgroundColor = UIColor(r: 127, g: 127, b: 127)
            return line
        }()
        let grayLine2 : UIView = {
            let line = UIView()
            line.backgroundColor = UIColor(r: 127, g: 127, b: 127)
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
        
        // Constrain logo in topHalf
        topHalf.addSubview(logoTitle)
        logoTitle.snp.makeConstraints {(makeLogo) in
            makeLogo.center.equalTo(topHalf)
            makeLogo.height.equalTo(topHalf.snp.height).multipliedBy(0.33)
        }
        
        v.addSubview(bottomHalf)
        bottomHalf.snp.makeConstraints( {(makeBot) in
            makeBot.top.equalTo(topHalf.snp.bottom)
            makeBot.width.equalTo(v.snp.width)
            makeBot.bottom.equalTo(v.snp.bottom)
        })
        
        // MARK: Email views
        bottomHalf.addSubview(emailField)
        emailField.snp.makeConstraints {(makeEmail) in
            makeEmail.top.equalTo(bottomHalf.snp.top)
            makeEmail.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
//            makeEmail.left.
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
        
        // MARK: Password views
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
    }
    
    func setupContentsTopHalf (){
        //Placeholder for now
        //let loginLogoImage = UIImage()
//        loginLogoIma
    }
    
    func setupContentsBottomHalf () {
        
    }
    
    
}
