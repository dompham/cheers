//
//  LoggingService.swift
//  Cheers
//
//  Created by Do Pham on 6/9/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation

class LoggingService {
    static let sharedInstance = LoggingService()
    // 0-3 Silence/General/Debug/All
    let volume = 3
    
    func log(volume lvl: Int, say str: String) {
        if (lvl <= self.volume) {
            print(str)
        }
    }
}
