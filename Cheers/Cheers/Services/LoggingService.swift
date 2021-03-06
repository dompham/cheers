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
    // 0-3 Silence/Errors/Debug/All
    let volume = 2
    
    func log(volume lvl: Int, say str: String) {
        if (lvl <= self.volume) {
            print(str)
        }
    }
}
