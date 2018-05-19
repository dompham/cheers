//
//  HeaderCell.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

class RecentHeader: DatasourceCell {
    let textLabel : UILabel = {
        let label = UILabel()
        label.text = "RECENT CHEERS"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white

        addSubview(textLabel)
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
