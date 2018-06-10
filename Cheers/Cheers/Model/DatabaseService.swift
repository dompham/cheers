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
    var arrOfCheers : [Cheer] = []
    
    func getPosts(for user: String, then cb: @escaping (_ : [Cheer]) -> Void) -> [Cheer]{
        ref.child("posts").child(user).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            if let resources = snapshot.value as? [String : AnyObject] {
                for (_, obj) in resources {
                    if let dataObject = obj as? [String : AnyObject] {
                        let tempCheer = Cheer(name: dataObject["name"] as! String,
                                              beer: dataObject["beer"] as! String,
                                              location: dataObject["location"] as! String,
                                              review: dataObject["review"] as! String,
                                              profileImage: #imageLiteral(resourceName: "dpham_stub_pic"))
                    self.arrOfCheers.append(tempCheer)
                    }
                }
            }
            
            cb(self.arrOfCheers)
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return arrOfCheers
    }
}
