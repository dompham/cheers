//
//  RecentFooter.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

class RecentFooter: DatasourceCell {
    let textLabel : UILabel = {
        let label = UILabel()
        label.text = "Dismiss"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = cheersBlue
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        let whiteBuffer = UIView()
        whiteBuffer.backgroundColor = .white

        addSubview(whiteBuffer)
        addSubview(textLabel)
        
        whiteBuffer.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        textLabel.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 12, widthConstant: 0, heightConstant: 0)    }
}
