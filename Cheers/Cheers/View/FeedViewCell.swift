//
//  FeedViewCell.swift
//  Cheers
//
//  Created by Do Pham on 5/19/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents
import RxGesture
import RxSwift
import FirebaseDatabase
import Firebase
import SnapKit

class FeedViewCall : DatasourceCell {
    let disposeBag = DisposeBag()
    var ref: DatabaseReference!
    
    // Profile picture
    let profileImageView : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    // Username
    let usernameLabel : UILabel = {
        let name = UILabel()
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.backgroundColor = .white
        return name
    }()
    
    //Beer @
    let beerLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = cheersBlue
        label.backgroundColor = .white
        return label
    }()
    
    // @
    let locationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textColor = cheersBlue
        return label
    }()
    
//    let feedCheerText : UITextView = {
//        let feedCheer = UITextView()
//        feedCheer.font = UIFont.systemFont(ofSize: 15)
//        feedCheer.backgroundColor = .clear
//        feedCheer.isScrollEnabled = false
//        feedCheer.showsVerticalScrollIndicator = false
//        feedCheer.isEditable = false
//        feedCheer.backgroundColor = .green
//        return feedCheer
//    }()
    
    //TODO: UIImage
    let beerPic : UIImageView = {
//        let pic = UIView()
//        pic.backgroundColor = .gray
        let pic = UIImageView()
        pic.image = #imageLiteral(resourceName: "pabst")
        
        return pic
    }()
    

    
    // View post button
    let viewPostButton : UIButton = {
        let viewPostButton = UIButton()
        viewPostButton.backgroundColor = .white
//        viewPostButton.layer.cornerRadius = 5
//        viewPostButton.layer.borderColor = cheersBlue.cgColor
//        viewPostButton.layer.borderWidth = 1
        viewPostButton.setTitleColor(cheersBlue, for: .normal)
        viewPostButton.setImage(#imageLiteral(resourceName: "view-more"), for: .normal)
        viewPostButton.imageView?.contentMode = .scaleAspectFit
        viewPostButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 2)
        return viewPostButton
    }()
    
    let commentButton : UIButton = {
        let commentButton = UIButton()
        commentButton.backgroundColor = .white
        //        viewPostButton.layer.cornerRadius = 5
        //        viewPostButton.layer.borderColor = cheersBlue.cgColor
        //        viewPostButton.layer.borderWidth = 1
        commentButton.setTitleColor(cheersBlue, for: .normal)
        commentButton.setImage(#imageLiteral(resourceName: "speech-bubble-oval-shape-with-text-lines"), for: .normal)
        commentButton.imageView?.contentMode = .scaleAspectFit
        commentButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 2)
        return commentButton
    }()
    
    let likeButton : UIButton = {
        let likeButton = UIButton()
        likeButton.backgroundColor = .white
        //        viewPostButton.layer.cornerRadius = 5
        //        viewPostButton.layer.borderColor = cheersBlue.cgColor
        //        viewPostButton.layer.borderWidth = 1
        likeButton.setTitleColor(cheersBlue, for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "heart-outline"), for: .normal)
        likeButton.imageView?.contentMode = .scaleAspectFit
        likeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 2)
        return likeButton
    }()
    
    let separatorView : UIView = {
        let separator = UIView()
        separator.backgroundColor = lightCheersBlue
        return separator
    }()
    
    let interactionContainer : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let commentViewSeparator : UIView = {
        let line = UIView()
        line.backgroundColor = cheersBlue
        return line
    }()
    let likeCommentSeparator : UIView = {
        let line = UIView()
        line.backgroundColor = cheersBlue
        return line
    }()

   
    override func setupViews() {
        super.setupViews()
        connectDB()
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = .white
        
        // MARK: Placement and constraints
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(beerLabel)
//        addSubview(feedCheerText)
//        addSubview(locationLabel)
        addSubview(beerPic)
        addSubview(separatorView)
        addSubview(interactionContainer)
        interactionContainer.addSubview(commentButton)
        interactionContainer.addSubview(viewPostButton)
        interactionContainer.addSubview(likeButton)

        interactionContainer.addSubview(commentViewSeparator)
        interactionContainer.addSubview(likeCommentSeparator)


        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        usernameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 22)
        
        beerLabel.anchor(usernameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 22)
        
//        feedCheerText.anchor(beerLabel.bottomAnchor, left: beerLabel.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
//
//        viewPostButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 34, heightConstant: 36)
//
//        locationLabel.anchor(feedCheerText.bottomAnchor, left: beerLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        beerPic.snp.makeConstraints { (makePic) in
            makePic.top.equalTo(profileImageView.snp.bottom).offset(8)
            makePic.centerX.equalTo(self.snp.centerX)
            makePic.height.equalTo(350)
            makePic.width.equalTo(262)
        }
        
        interactionContainer.snp.makeConstraints { (makeCtn) in
            makeCtn.top.equalTo(beerPic.snp.bottom).offset(4)
            makeCtn.centerX.equalTo(beerPic.snp.centerX)
            makeCtn.width.equalTo(beerPic.snp.width)
            makeCtn.height.equalTo(44)
        }
        
        commentButton.snp.makeConstraints { (makeBtn) in
            makeBtn.top.equalTo(interactionContainer.snp.top)
            makeBtn.centerY.equalTo(interactionContainer.snp.centerY)
            makeBtn.centerX.equalTo(interactionContainer.snp.centerX)
            makeBtn.height.width.equalTo(22)
        }
        
        commentViewSeparator.snp.makeConstraints { (makeLine) in
            makeLine.top.equalTo(interactionContainer.snp.top).offset(8)
            makeLine.bottom.equalTo(interactionContainer.snp.bottom).offset(-8)
            makeLine.width.equalTo(1)
            makeLine.left.equalTo(commentButton.snp.right).offset(25)
        }
        
        viewPostButton.snp.makeConstraints { (makeBtn) in
            makeBtn.top.equalTo(interactionContainer.snp.top)
            makeBtn.centerY.equalTo(interactionContainer.snp.centerY)
            makeBtn.left.equalTo(commentViewSeparator.snp.right).offset(18)
            makeBtn.height.width.equalTo(30)
        }
        
        likeCommentSeparator.snp.makeConstraints { (makeLine) in
            makeLine.top.equalTo(interactionContainer.snp.top).offset(8)
            makeLine.bottom.equalTo(interactionContainer.snp.bottom).offset(-8)
            makeLine.width.equalTo(1)
            makeLine.right.equalTo(commentButton.snp.left).offset(-25)
        }

        likeButton.snp.makeConstraints { (makeBtn) in
            makeBtn.top.equalTo(interactionContainer.snp.top)
            makeBtn.centerY.equalTo(interactionContainer.snp.centerY)
            makeBtn.right.equalTo(likeCommentSeparator.snp.left).offset(-25)
            makeBtn.height.width.equalTo(22)
        }
        

//        beerPic.anchor(locationLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 300)
        
        separatorView.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 10)
        
        // MARK: UI Wiring
        setupViewPostButton(viewPostButton)
    }
    
    func setupViewPostButton (_ button : UIButton) {
        button.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
            }).disposed(by: disposeBag)
    }
    
    func connectDB(){
        ref = Database.database().reference()
    }
    
    override var datasourceItem: Any? {
        didSet {
            guard let cheer = datasourceItem as? Cheer else {return}
            usernameLabel.text = cheer.name
            beerLabel.text = cheer.beer
//            feedCheerText.text = cheer.review
            locationLabel.text = "@ " + cheer.location
            profileImageView.image = cheer.profileImage
        }
    }
}
