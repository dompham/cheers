//
//  BeerCell.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

//AKA UserCell
class RecentBeerCell: DatasourceCell {
    

    
    // Profile picture
    let profileImageView : UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "dpham_stub_pic")
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    // Username
    let usernameLabel : UILabel = {
        let name = UILabel()
        name.text = "dompham"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        //name.backgroundColor = .purple
        return name
    }()
    
    //Beer @
    let beerLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 226, g: 169, b: 54)
        return label
    }()
    
    // Recent cheer
    let recentCheerText : UITextView = {
        let recentCheer = UITextView()
        recentCheer.text = "Not only does this beer taste delicious, it feels “delicious” in the mouth. The rich body matches the flavor profile. This is a big beer but not overwhelming."
        recentCheer.font = UIFont.systemFont(ofSize: 15)
        return recentCheer
    }()
    
    // Add button
    let addBuddyButton : UIButton = {
        let addButton = UIButton()
        addButton.backgroundColor = .cyan
        return addButton
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(profileImageView)
        addSubview(beerLabel)
        addSubview(usernameLabel)
        addSubview(recentCheerText)
        addSubview(addBuddyButton)
        
        // MARK: Constraints for Recent Cell Subviews
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        usernameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: addBuddyButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)

        beerLabel.anchor(usernameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: addBuddyButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)

        recentCheerText.anchor(beerLabel.bottomAnchor, left: beerLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        addBuddyButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
    
    override var datasourceItem: Any? {
        didSet {
            beerLabel.text = datasourceItem as? String
        }
    }
    

}
