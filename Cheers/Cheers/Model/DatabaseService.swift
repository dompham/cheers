//
//  FirebaseService.swift
//  Cheers
//
//  Created by Do Pham on 6/9/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import Firebase

class DatabaseService {
    var ref = Database.database().reference()

    func getPosts(for user: String) {
        ref.child("posts").child(user).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            print(user)
            print(snapshot)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
