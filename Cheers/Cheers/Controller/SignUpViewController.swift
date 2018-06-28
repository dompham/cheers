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
    let viewCollection = SignUpView()
    let topHalf = UIView()
    
    let bottomHalf = UIView()
    
    var logoImage : UIImageView!
    var logoTitle : UILabel!
    var logoSubTitle : UILabel!
    var nameField : UITextField!
    var nameImage : UIImageView!
    var emailField : UITextField!
    var emailImage : UIImageView!
    var pwField : UITextField!
    var pwImage : UIImageView!
    var pwConfirmField : UITextField!
    var pwConfirmImage : UIImageView!
    var createAccButton : UIButton!
    var backLabel : UILabel!
    
    var grayLine : UIView!
    var grayLine2 : UIView!
    var grayLine3 : UIView!
    var grayLine4 : UIView!
    
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
        injectViews()
        initViews(for: self.view)
        
    }
    
    func injectViews(){
        logoImage = viewCollection.logoImage
        logoTitle = viewCollection.logoTitle
        logoSubTitle = viewCollection.logoSubTitle
        emailField = viewCollection.emailField
        emailImage = viewCollection.emailImage
        pwField = viewCollection.pwField
        pwImage = viewCollection.pwImage
        nameField = viewCollection.nameField
        nameImage = viewCollection.nameImage
        pwConfirmField = viewCollection.pwConfirmField
        pwConfirmImage = viewCollection.pwConfirmImage
        createAccButton = viewCollection.createAccButton
        backLabel = viewCollection.backLabel
        grayLine = viewCollection.grayLine
        grayLine2 = viewCollection.grayLine2
        grayLine3 = viewCollection.grayLine3
        grayLine4 = viewCollection.grayLine4
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
