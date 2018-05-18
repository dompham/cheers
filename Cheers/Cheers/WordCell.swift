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
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupViews();
    }
    
    func setupViews() {
        backgroundColor = .gray;
        addSubview(wordLabel);
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true;
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true;
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
