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
import FirebaseAuth
import MaterialComponents.MaterialActivityIndicator

class LoginViewController : UIViewController {
    let disposeBag = DisposeBag()
    var handle: AuthStateDidChangeListenerHandle?;
    let viewCollection = LoginView()
    // Start UI Elements
    var logoImage : UIImageView!
    var logoTitle : UILabel!
    var logoSubTitle : UILabel!
    var emailField : UITextField!
    var emailImage : UIImageView!
    var pwField : UITextField!
    var pwImage : UIImageView!
    var loginButton : UIButton!
    var helpLoginLabel : UILabel!
    var createAccountLabel : UILabel!
    var wrongLoginLabel : UILabel!
    var grayLine : UIView!
    var grayLine2 : UIView!
    // End UI Elements
    
    // MARK: Sign in action
    func setSignInButtonAction (on button : UIButton, using emailField : UITextField, and passwordField : UITextField) {
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
                                
                guard let email = emailField.text, let password = passwordField.text
                    else {
                        return
                }
                
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    // To make the activity indicator disappear:
                    activityIndicator.stopAnimating()
                    if (error != nil) {
                        logService.log(volume: 1, say: "Sign in error: " + (error?.localizedDescription)!)
                        self.fadeViewInThenOut(view: self.wrongLoginLabel, delay: 1)

                        return
                    } else {
                        logService.log(volume: 2, say: "Signed In")
                        
                        UIApplication.shared.statusBarStyle = .default
                        DBservice.getDisplayName(for: (user?.user.email!)!, then: { (displayName) in
                            myProfile.displayName = displayName
                            DBservice.initMyProfile {
                                self.present(TabBarViewController(), animated: true, completion: { () in
                                })
                            }
                        })
                    }
                }
                
            }).disposed(by: disposeBag)
    }
    // MARK: Go To Create Account View
    func setGoToMakeAccAction (_ label : UILabel) {
        label.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                UIApplication.shared.statusBarStyle = .default
                let signUpView = SignUpViewController()
                signUpView.modalTransitionStyle = .crossDissolve
                self.present(signUpView, animated: true, completion: { () in
                    
                })
            }).disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Make sure keyboard dips
        self.hideKeyboardWhenTappedAround()

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
        setupLoginContainers(for: self.view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//       handle = Auth.auth().addStateDidChangeListener { auth, user in
//            if let user = user {
//                print("User is signed in.")
//            } else {
//                print("User is not signed in.")
//            }
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        Auth.auth().removeStateDidChangeListener(handle!)

    }
    
    func injectViews(){
         logoImage = viewCollection.logoImage
         logoTitle = viewCollection.logoTitle
         logoSubTitle = viewCollection.logoSubTitle
         emailField = viewCollection.emailField
         emailImage = viewCollection.emailImage
         pwField = viewCollection.pwField
         pwImage = viewCollection.pwImage
         loginButton = viewCollection.loginButton
         helpLoginLabel = viewCollection.helpLoginLabel
         createAccountLabel = viewCollection.createAccountLabel
         wrongLoginLabel = viewCollection.wrongLoginLabel
         grayLine = viewCollection.grayLine
         grayLine2 = viewCollection.grayLine2
    }
    
    func setupLoginContainers(for v : UIView){
        
        let topHalf = UIView()
        
        let bottomHalf = UIView()
        
        // MARK: Assembling views
        v.addSubview(topHalf)
        topHalf.addSubview(logoImage)
        topHalf.addSubview(logoTitle)
        topHalf.addSubview(logoSubTitle)
        topHalf.addSubview(wrongLoginLabel)
        
        v.addSubview(bottomHalf)
        bottomHalf.addSubview(emailField)
        bottomHalf.addSubview(emailImage)
        bottomHalf.addSubview(grayLine)
        bottomHalf.addSubview(pwField)
        bottomHalf.addSubview(loginButton)
        setSignInButtonAction(on: loginButton, using: emailField, and: pwField)
        bottomHalf.addSubview(grayLine2)
        bottomHalf.addSubview(helpLoginLabel)
        bottomHalf.addSubview(createAccountLabel)
        setGoToMakeAccAction(createAccountLabel)

        let h:Double  = Double(view.bounds.size.height)
        // MARK: Constraints - Top Container
        topHalf.snp.makeConstraints { (makeTop) in
            makeTop.top.equalTo(v.snp.top)
            makeTop.width.equalTo(v.snp.width)
            // Offset bottom by less than half
            makeTop.bottom.equalTo(v.snp.bottom).offset((h/1.8) * -1)
        }
        
        // MARK: Constraints - Lower Container
        logoImage.snp.makeConstraints {(makeLogo) in
            makeLogo.center.equalTo(topHalf)
            makeLogo.height.width.equalTo(topHalf.snp.height).multipliedBy(0.180)
            //            makeLogo.width.equalTo()
        }
        
        //MARK: Constraints - title
        logoTitle.snp.makeConstraints{(makeTitle) in
            makeTitle.centerX.equalTo(logoImage.snp.centerX)
            makeTitle.top.equalTo(logoImage.snp.bottom).offset(10)
        }
        
        //MARK: Constraints - subtitle
        logoSubTitle.snp.makeConstraints{(makeSubTitle) in
            makeSubTitle.centerX.equalTo(logoImage.snp.centerX)
            makeSubTitle.top.equalTo(logoTitle.snp.bottom).offset(5)
        }
        //MARK: Constraints - Wrong Login Label
        wrongLoginLabel.snp.makeConstraints {(makeLabel) in
            makeLabel.centerX.equalTo(logoImage.snp.centerX)
            makeLabel.top.equalTo(logoSubTitle.snp.bottom).offset(15)
        }
        
                // MARK: Constraints - Bottom Half
        bottomHalf.snp.makeConstraints( {(makeBot) in
            makeBot.top.equalTo(topHalf.snp.bottom)
            makeBot.width.equalTo(v.snp.width)
            makeBot.bottom.equalTo(v.snp.bottom)
        })
        
        // MARK: Constraints - Email field
        emailField.snp.makeConstraints {(makeEmail) in
            makeEmail.top.equalTo(bottomHalf.snp.top)
            makeEmail.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makeEmail.height.equalTo(45)
            makeEmail.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
                // MARK: Constraints - Email Image
        emailImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(emailField.snp.left)
            makeImage.bottom.equalTo(emailField.snp.bottom).offset(-10)
            makeImage.top.equalTo(emailField.snp.top).offset(5)
        }
        
                // MARK: Constraints - Gray Line 1
        grayLine.snp.makeConstraints {(makeLine) in
            makeLine.top.equalTo(emailField.snp.bottom).offset(2)
            makeLine.left.equalTo(emailImage.snp.left)
            makeLine.right.equalTo(emailField.snp.right)
            //makeLine.centerX.equalTo(bottomHalf.snp.centerX)
            makeLine.height.equalTo(0.5)
        }
        
        // MARK: Constraints - Password field
        pwField.snp.makeConstraints {(makePassword) in
            makePassword.top.equalTo(grayLine.snp.bottom).offset(15)
            makePassword.centerX.equalTo(bottomHalf.snp.centerX).offset(15)
            makePassword.height.equalTo(45)
            makePassword.width.equalTo(bottomHalf.snp.width).multipliedBy(0.55)
        }
        
                // MARK: Constraints - Password Image
        bottomHalf.addSubview(pwImage)
        pwImage.snp.makeConstraints { (makeImage) in
            makeImage.right.equalTo(emailField.snp.left)
            makeImage.bottom.equalTo(pwField.snp.bottom).offset(-10)
            makeImage.top.equalTo(pwField.snp.top).offset(5)
        }
        
                // MARK: Constraints - Gray line 2
        grayLine2.snp.makeConstraints {(makeLine2) in
            makeLine2.top.equalTo(pwField.snp.bottom).offset(1)//.offset(5)
            makeLine2.left.equalTo(pwImage.snp.left)
            makeLine2.right.equalTo(pwField.snp.right)
            makeLine2.height.equalTo(0.5)
        }
        
        // MARK: Constraints - Login button
        loginButton.snp.makeConstraints {(makeButton) in
            makeButton.top.equalTo(grayLine2.snp.bottom).offset(20)
            makeButton.height.equalTo(50)
            makeButton.right.equalTo(pwField.snp.right).offset(-20)
            makeButton.left.equalTo(pwImage.snp.left).offset(20)
        }
        
        
        // MARK: Constraints - Help log in label
        helpLoginLabel.snp.makeConstraints {(makeHelp) in
            makeHelp.top.equalTo(loginButton.snp.bottom).offset(15)
            makeHelp.centerX.equalTo(loginButton.snp.centerX)
        }
        
        //MARK: Constraints - Create account label
        createAccountLabel.snp.makeConstraints{(makeNewAccLabel) in
            makeNewAccLabel.bottom.equalTo(bottomHalf.snp.bottom).offset(-20)
            makeNewAccLabel.centerX.equalTo(helpLoginLabel.snp.centerX)
        }
        
        
    }
    func fadeViewInThenOut(view : UIView, delay: TimeInterval) {
        
        let animationDuration = 0.5
        
        // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            view.alpha = 1
        }) { (Bool) -> Void in
            
            // After the animation completes, fade out the view after a delay
            
            UIView.animate(withDuration: animationDuration, delay: delay, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
                view.alpha = 0
            },
                                       completion: nil)
        }
    }
}
