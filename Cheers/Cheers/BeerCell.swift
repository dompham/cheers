//
//  BeerCell.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

class BeerCell: DatasourceCell {
    
    let beerLabel : UILabel = {
    let label = UILabel()
    label.text = "hi"
    return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(beerLabel)
        beerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    override var datasourceItem: Any? {
        didSet {
            beerLabel.text = datasourceItem as? String
        }
    }
}
