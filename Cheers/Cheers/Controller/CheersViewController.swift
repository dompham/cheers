//
//  CheersHomeController.swift
//  Cheers
//
//  Created by Do Pham on 5/21/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CheersViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupLoginSeparators(for: self.view)
    }
    
    func setupLoginSeparators(for v : UIView){
        
        var topHalf = UIView()
        topHalf.backgroundColor = .red
        var bottomHalf = UIView()
        bottomHalf.backgroundColor = .green
        
//        var bounds: CGRect = UIScreen.mainScreen().bounds
        //let w:Int  = Int(view.bounds.size.width)
        let h:Double  = Double(view.bounds.size.height)
        
        v.addSubview(topHalf)
        topHalf.snp.makeConstraints { (makeTop) in
            makeTop.top.equalTo(v.snp.top)
            makeTop.width.equalTo(v.snp.width)
            // Offset bottom by less than half
            makeTop.bottom.equalTo(v.snp.bottom).offset((h/1.8) * -1)
        }
        
        v.addSubview(bottomHalf)
        bottomHalf.snp.makeConstraints( {(makeBot) in
            makeBot.top.equalTo(topHalf.snp.bottom)
            makeBot.width.equalTo(v.snp.width)
            makeBot.bottom.equalTo(v.snp.bottom)
            
        })
    }
    
    
    
}
