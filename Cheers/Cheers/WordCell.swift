//
//  WordCell.swift
//  Cheers
//
//  Created by Do Pham on 5/17/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import UIKit

class WordCell : UICollectionViewCell {
    let wordLabel: UILabel = {
        let label = UILabel();
        label.text = "Test";
        return label;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupViews();
    }
    
    func setupViews() {
        backgroundColor = .gray;
        addSubview(wordLabel);
        wordLabel.topAnchor.constraintEqualToSystemSpacingBelow(<#T##anchor: NSLayoutYAxisAnchor##NSLayoutYAxisAnchor#>, multiplier: <#T##CGFloat#>)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
