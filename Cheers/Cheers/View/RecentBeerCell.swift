//
//  BeerCell.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

let cheersOrange : UIColor = UIColor(r: 255, g: 181, b: 69)
let cheersBlue : UIColor = UIColor(r: 68, g: 142, b: 255)

//AKA UserCell
class RecentBeerCell: DatasourceCell {
    
    
    // Profile picture
    let profileImageView : UIImageView = {
        let image = UIImageView()
        //image.image = #imageLiteral(resourceName: "dpham_stub_pic")
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    // Username
    let usernameLabel : UILabel = {
        let name = UILabel()
        //name.text = "dompham"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        return name
    }()
    
    //Beer @
    let beerLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = cheersBlue
        return label
    }()
    
    // @
    let locationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textColor = cheersBlue
        //label.text = "@ The Ugly Dog"
        return label
    }()
    
    // Recent cheer
    let recentCheerText : UITextView = {
        let recentCheer = UITextView()
        //recentCheer.text = "Not only does this beer taste delicious, it feels “delicious” in the mouth. The rich body matches the flavor profile. This is a big beer but not overwhelming."
        recentCheer.font = UIFont.systemFont(ofSize: 15)
        recentCheer.backgroundColor = .clear
        recentCheer.isScrollEnabled = false
        recentCheer.showsVerticalScrollIndicator = false
        recentCheer.isEditable = false
        return recentCheer
    }()
    
    // Add button
    let subBuddyButton : UIButton = {
        let subButton = UIButton()
        
        subButton.layer.cornerRadius = 5
        subButton.layer.borderColor = cheersBlue.cgColor
        subButton.layer.borderWidth = 1
        subButton.setTitle("Subscribe", for: .normal)
        subButton.setTitleColor(cheersBlue, for: .normal)
        subButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        subButton.titleEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0)
        subButton.setImage(#imageLiteral(resourceName: "sub_button"), for: .normal)
        subButton.imageView?.contentMode = .scaleAspectFit
        subButton.imageEdgeInsets = UIEdgeInsetsMake(4, -6, 4, 0)
        return subButton
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)

        
        addSubview(profileImageView)
        addSubview(beerLabel)
        addSubview(usernameLabel)
        addSubview(recentCheerText)
        addSubview(locationLabel)
        addSubview(subBuddyButton)
        
        
        // MARK: Constraints for Recent Cell Subviews
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        usernameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: subBuddyButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 22)

        beerLabel.anchor(usernameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: subBuddyButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 22)

        recentCheerText.anchor(beerLabel.bottomAnchor, left: beerLabel.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        locationLabel.anchor(recentCheerText.bottomAnchor, left: beerLabel.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        subBuddyButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 36)
        
    }
    
    override var datasourceItem: Any? {
        didSet {
            guard let recentCheer = datasourceItem as? Cheer else {return}
            usernameLabel.text = recentCheer.name
            beerLabel.text = recentCheer.beer
            recentCheerText.text = recentCheer.review
            locationLabel.text = recentCheer.location
            profileImageView.image = recentCheer.profileImage
        }
    }
    

}
