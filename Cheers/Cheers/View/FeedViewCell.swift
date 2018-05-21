//
//  FeedViewCell.swift
//  Cheers
//
//  Created by Do Pham on 5/19/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

class FeedViewCall : DatasourceCell {
    
    // Profile picture
    let profileImageView : UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "oramos")
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    // Username
    let usernameLabel : UILabel = {
        let name = UILabel()
        name.text = "oramos"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.backgroundColor = .white
        return name
    }()
    
    //Beer @
    let beerLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = cheersBlue
        label.text = "Some Dark Stout"
        label.backgroundColor = .white
        return label
    }()
    
    // @
    let locationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textColor = cheersBlue
        label.text = "@ The Ugly Dog"
        return label
    }()
    
    let feedCheerText : UITextView = {
        let feedCheer = UITextView()
        feedCheer.text = "Have to drink something heavy first then ease into something light."
        feedCheer.font = UIFont.systemFont(ofSize: 15)
        feedCheer.backgroundColor = .clear
        feedCheer.isScrollEnabled = false
        feedCheer.showsVerticalScrollIndicator = false
        feedCheer.isEditable = false
        return feedCheer
    }()
    
    // View post button
    let viewPostButton : UIButton = {
        let viewPostButton = UIButton()
        viewPostButton.backgroundColor = .white
        viewPostButton.layer.cornerRadius = 5
        viewPostButton.layer.borderColor = cheersBlue.cgColor
        viewPostButton.layer.borderWidth = 1
//        viewPostButton.setTitle("Subscribe", for: .normal)
        viewPostButton.setTitleColor(cheersBlue, for: .normal)
//        viewPostButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
//        viewPostButton.titleEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0)
        viewPostButton.setImage(#imageLiteral(resourceName: "view-more"), for: .normal)
        viewPostButton.imageView?.contentMode = .scaleAspectFit
        viewPostButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 2)
        return viewPostButton
    }()
   
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(beerLabel)
        addSubview(feedCheerText)
        addSubview(locationLabel)
        addSubview(viewPostButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        usernameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: viewPostButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 22)
        
        beerLabel.anchor(usernameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: viewPostButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 22)
        
        feedCheerText.anchor(beerLabel.bottomAnchor, left: beerLabel.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        viewPostButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 34, heightConstant: 36)
        
        locationLabel.anchor(feedCheerText.bottomAnchor, left: beerLabel.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}