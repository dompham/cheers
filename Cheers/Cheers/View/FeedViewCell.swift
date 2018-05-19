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
        image.image = #imageLiteral(resourceName: "dpham_stub_pic")
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
    
    
   
    override func setupViews() {
        super.setupViews()
        backgroundColor = .gray
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = .black
        
        addSubview(profileImageView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
    }
}
