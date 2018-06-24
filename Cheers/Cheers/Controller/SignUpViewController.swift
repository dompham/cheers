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
import FirebaseAuth
import Firebase
import MaterialComponents.MaterialActivityIndicator
import Onboard


class SignUpViewController : UIViewController {
    let disposeBag = DisposeBag()
    var ref: DatabaseReference!
    let topHalf = UIView()
    
    let bottomHalf = UIView()
    
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
        title.text = "New Account"
        title.textColor = .white
        title.font = UIFont(name: "HoeflerText-Regular", size: 18)
        title.backgroundColor = .clear
        return title
    }()
    
    // MARK: UI Element - Name field
    let nameField : UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(string: "Display Name", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        field.borderStyle = .none
        field.backgroundColor = .clear
        field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
        field.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        field.clearButtonMode = .whileEditing
        
        return field
    }()
    
    // MARK: UI Element - Name Image
    let nameImage : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "un")
        imageView.tintColor = .white
        imageView.image = image
        
        return imageView
    }()
    
    
    // MARK: UI Element - Email field
    let emailField : UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        field.borderStyle = .none
        field.backgroundColor = .clear
        field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
        field.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        field.clearButtonMode = .whileEditing
        
        return field
    }()
    
    // MARK: UI Element - Email Image
    let emailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        imageView.contentMode = .scaleAspectFit
        //            let image = #imageLiteral(resourceName: "un")
        let image = #imageLiteral(resourceName: "mail")
        imageView.tintColor = .white
        imageView.image = image
        
        return imageView
    }()
    
    // MARK: UI Element - Password Field
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
    
    // MARK: UI Element - Password Image 1
    let pwImage : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "pw")
        imageView.tintColor = .white
        imageView.image = image
        
        return imageView
    }()
    
    // MARK: UI Element - Confirm pw
    let pwConfirmField : UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(string: "Confirm", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        field.borderStyle = .none
        field.backgroundColor = .clear
        field.textColor = .white//UIColor(r: 127, g: 127, b: 127)
        field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
        field.clearButtonMode = .whileEditing
        field.isSecureTextEntry = true
        
        return field
    }()
    // MARK: UI Element - Confirm PW Image
    let pwConfirmImage : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "pw")
        imageView.tintColor = .white
        imageView.image = image
        
        return imageView
    }()
    
    
    // MARK: UI Element - Create Account Button
    let createAccButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Get to Drinking", for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        //            button.titleLabel?.font = UIFont.typewrit//americantyp(ofSize: 20)
        button.layer.borderColor = UIColor(r: 255, g: 255, b: 255).cgColor
        button.layer.borderWidth = 4.0
        button.layer.cornerRadius = 8.0
        
        return button
    }()
    
    // MARK: UI Element - Return to sign in Label
    let backLabel : UILabel = {
        let label = UILabel()
        label.text = "Already have one?"
        label.textColor = .white
        
        return label
    }()
    
    
    // MARK: UI Element - Gray lines
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
    let grayLine3 : UIView = {
        let line = UIView()
        line.backgroundColor = .white//UIColor(r: 127, g: 127, b: 127)
        return line
    }()
    let grayLine4 : UIView = {
        let line = UIView()
        line.backgroundColor = .white//UIColor(r: 127, g: 127, b: 127)
        return line
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make sure keyboard dips
        self.hideKeyboardWhenTappedAround()
        // Set database reference
        ref = Database.database().reference()
        
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
    
    // MARK: Action - Back to sign in
    func setHaveAccountAction (_ label : UILabel) {
        label.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                logService.log(volume: 2, say: "Already have an account, transitioning back to log in")
                UIApplication.shared.statusBarStyle = .default
                let loginView = LoginViewController()
                loginView.modalTransitionStyle = .crossDissolve
                self.present(loginView, animated: true, completion: { () in
                    
                })
            }).disposed(by: disposeBag)
    }
    
    // MARK: Action - Create new account
    func setCreateAccountAction (on button : UIButton, using emailField : UITextField, and passwordField : UITextField, for nameField : UITextField) {
        button.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                // Set and constrain activity wheel
                let activityIndicator = MDCActivityIndicator()
                activityIndicator.sizeToFit()
                self.view.addSubview(activityIndicator)
                activityIndicator.snp.makeConstraints {(makeWheel) in
                    makeWheel.center.equalTo(self.view.snp.center)
                }
                // To make the activity indicator appear:
                activityIndicator.startAnimating()
                
                logService.log(volume: 2, say: "Attempting to create new account")
                guard let email = emailField.text, let password = passwordField.text, let name = nameField.text
                    else {
                        return
                }

                Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                    // To make the activity indicator disappear:
                    activityIndicator.stopAnimating()
                    
                    if (error != nil) {
                        logService.log(volume: 1, say: "Account creation error: " + (error?.localizedDescription)! )
                        return
                    } else {
                        let user = authResult?.user
//                        myProfile.uid = user!.email
                        myProfile.email = user!.email
                        myProfile.displayName = name
                        // Create user in db?
                        self.createUserDB(for: user!)
                        
                        // MARK: Onboarding
                        let firstOnboard = OnboardingContentViewController(title: "Drink.", body: "Enjoy beers, while posting to share with friends.", image: UIImage(named: "onboard1"), buttonText: nil) { () -> Void in}
                        firstOnboard.underTitlePadding = 60
                        firstOnboard.bodyLabel.font = UIFont.systemFont(ofSize: 22)
                        
                        let secondOnboard = OnboardingContentViewController(title: "Earn.", body: "Accumulate achievements as you go along.", image: UIImage(named: "onboard2"), buttonText: nil) { () -> Void in}
                        secondOnboard.underTitlePadding = 60
                        secondOnboard.bodyLabel.font = UIFont.systemFont(ofSize: 22)
                        
                        let thirdOnboard = OnboardingContentViewController(title: "Know.", body: "Receive analytics based on your beer enjoyment.", image: UIImage(named: "onboard3"), buttonText: "Got it!") { () -> Void in
                            self.dismiss(animated: true, completion: { () in
                                self.present(TabBarViewController(), animated: true, completion: { () in
                                    
                                })
                            })
                        }
                        thirdOnboard.underTitlePadding = 60
                        thirdOnboard.bodyLabel.font = UIFont.systemFont(ofSize: 22)
                        
                        //Set the onboards
                        let onboardingVC = OnboardingViewController(backgroundImage: UIImage(named: "backgroundBlue"), contents: [firstOnboard, secondOnboard, thirdOnboard])
                        onboardingVC!.shouldMaskBackground = false
                        onboardingVC!.shouldFadeTransitions = true
                        self.present(onboardingVC!, animated: true, completion: { () in
                            
                        })

                    }
                }
            }).disposed(by: disposeBag)
    }
    
    func createUserDB(for user : User) {
        // I dont think we need this for users
//        let key = self.ref.child("users").childByAutoId().key
        
        let newUser = [
                      "displayName": myProfile.displayName as String,
                      "email": user.email! as String,
                      "uid": user.uid as String,
                      "subscribedTo": "TBD" as String,
            "subscribers": "TBD" as String
        ]
        // Adding to user tree
        self.ref.child("users").child(myProfile.displayName).setValue(newUser)
        
        // Adding to user map
        self.ref.child("nameEmailMaps").child(myProfile.displayName).setValue(myProfile.email)
    }
    
    func initViews(for v : UIView) {
        
        
        
        // MARK: Assembling views
        v.addSubview(topHalf)
        topHalf.addSubview(logoImage)
        topHalf.addSubview(logoTitle)
        topHalf.addSubview(logoSubTitle)
        
        v.addSubview(bottomHalf)
        bottomHalf.addSubview(nameField)
        bottomHalf.addSubview(nameImage)
        bottomHalf.addSubview(grayLine4)
        bottomHalf.addSubview(emailField)
        bottomHalf.addSubview(emailImage)
        bottomHalf.addSubview(grayLine)
        bottomHalf.addSubview(pwField)
        bottomHalf.addSubview(pwImage)
        bottomHalf.addSubview(grayLine2)
        bottomHalf.addSubview(pwConfirmField)
        bottomHalf.addSubview(pwConfirmImage)
        bottomHalf.addSubview(grayLine3)
        bottomHalf.addSubview(createAccButton)
        setCreateAccountAction(on: createAccButton, using: emailField, and: pwField, for: nameField)
        bottomHalf.addSubview(backLabel)
        setHaveAccountAction(backLabel)


        
        let h:Double  = Double(view.bounds.size.height)
        // Add and constraint to superview
        topHalf.snp.makeConstraints { (makeTop) in
            makeTop.top.equalTo(v.snp.top)
            makeTop.width.equalTo(v.snp.width)
            // Offset bottom by less than half
            makeTop.bottom.equalTo(v.snp.bottom).offset((h/1.6) * -1)
        }
        
        // MARK: Constrain logo in topHalf
        logoImage.snp.makeConstraints {(makeLogo) in
            makeLogo.center.equalTo(topHalf)
            makeLogo.height.width.equalTo(topHalf.snp.height).multipliedBy(0.180)
            //            makeLogo.width.equalTo()
        }
        
        //MARK: Constrain title
        logoTitle.snp.makeConstraints{(makeTitle) in
            makeTitle.centerX.equalTo(logoImage.snp.centerX)
            makeTitle.top.equalTo(logoImage.snp.bottom).offset(10)
        }
        
        //MARK: Constrain subtitle
        logoSubTitle.snp.makeConstraints{(makeSubTitle) in
            makeSubTitle.centerX.equalTo(logoImage.snp.centerX)
            makeSubTitle.top.equalTo(logoTitle.snp.bottom).offset(5)
        }
        
        
        bottomHalf.snp.makeConstraints( {(makeBot) in
            makeBot.top.equalTo(topHalf.snp.bottom)
            makeBot.width.equalTo(v.snp.width)
            makeBot.bottom.equalTo(v.snp.bottom)
        })
        
        // MARK: Constraints - Name Field
        nameField.snp.makeConstraints {(makeName) in
            makeName.top.equalTo(bottomHalf.snp.top)
            makeName.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makeName.height.equalTo(45)
            makeName.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
        
        // MARK: Constraints - Name Image
        nameImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(nameField.snp.left)
            makeImage.bottom.equalTo(nameField.snp.bottom).offset(-10)
            makeImage.top.equalTo(nameField.snp.top).offset(5)
        }
        
        grayLine4.snp.makeConstraints {(makeLine) in
            makeLine.top.equalTo(nameField.snp.bottom).offset(2)
            makeLine.left.equalTo(nameImage.snp.left)
            makeLine.right.equalTo(nameField.snp.right)
            //makeLine.centerX.equalTo(bottomHalf.snp.centerX)
            makeLine.height.equalTo(0.5)
        }

        // MARK: Constraints - Email Field
        emailField.snp.makeConstraints {(makeEmail) in
            makeEmail.top.equalTo(nameField.snp.bottom).offset(15)
            makeEmail.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makeEmail.height.equalTo(45)
            makeEmail.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
        
        emailImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(emailField.snp.left)
            makeImage.bottom.equalTo(emailField.snp.bottom).offset(-10)
            makeImage.top.equalTo(emailField.snp.top).offset(5)
        }
        
        grayLine.snp.makeConstraints {(makeLine) in
            makeLine.top.equalTo(emailField.snp.bottom).offset(2)
            makeLine.left.equalTo(emailImage.snp.left)
            makeLine.right.equalTo(emailField.snp.right)
            //makeLine.centerX.equalTo(bottomHalf.snp.centerX)
            makeLine.height.equalTo(0.5)
        }
        
        // MARK: Password Constraints
        pwField.snp.makeConstraints {(makePassword) in
            makePassword.top.equalTo(grayLine.snp.bottom).offset(15)
            makePassword.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makePassword.height.equalTo(45)
            makePassword.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
        
        pwImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(emailField.snp.left)
            makeImage.bottom.equalTo(pwField.snp.bottom).offset(-10)
            makeImage.top.equalTo(pwField.snp.top).offset(5)
        }
        
        grayLine2.snp.makeConstraints {(makeLine2) in
            makeLine2.top.equalTo(pwField.snp.bottom).offset(1)//.offset(5)
            makeLine2.left.equalTo(pwImage.snp.left)
            makeLine2.right.equalTo(pwField.snp.right)
            makeLine2.height.equalTo(0.5)
        }
        
        // MARK: Password Confirm Constraints
        pwConfirmField.snp.makeConstraints {(makePassword) in
            makePassword.top.equalTo(grayLine2.snp.bottom).offset(15)
            makePassword.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makePassword.height.equalTo(45)
            makePassword.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
        
        
        pwConfirmImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(pwConfirmField.snp.left)
            makeImage.bottom.equalTo(pwConfirmField.snp.bottom).offset(-10)
            makeImage.top.equalTo(pwConfirmField.snp.top).offset(5)
        }

        grayLine3.snp.makeConstraints {(makeLine3) in
            makeLine3.top.equalTo(pwConfirmField.snp.bottom).offset(1)//.offset(5)
            makeLine3.left.equalTo(pwConfirmImage.snp.left)
            makeLine3.right.equalTo(pwConfirmField.snp.right)
            makeLine3.height.equalTo(0.5)
        }
        
        
        
        // MARK: Create account button constraint
        createAccButton.snp.makeConstraints {(makeButton) in
            makeButton.top.equalTo(grayLine3.snp.bottom).offset(20)
            makeButton.height.equalTo(50)
            makeButton.right.equalTo(pwConfirmField.snp.right).offset(-20)
            makeButton.left.equalTo(pwConfirmImage.snp.left).offset(20)
        }
        
        // MARK: Constraint - Back
        // MARK: help logging in constraints
        backLabel.snp.makeConstraints {(makeBack) in
            makeBack.top.equalTo(createAccButton.snp.bottom).offset(15)
            makeBack.centerX.equalTo(createAccButton.snp.centerX)
        }
        
        
    }
}
