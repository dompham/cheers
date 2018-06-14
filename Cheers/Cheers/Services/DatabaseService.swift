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
    static let sharedInstance = DatabaseService()
    var ref = Database.database().reference()
    var arrOfCheers : [Cheer] = []
    
    // MARK: Feed functions
    func getPosts(for user: String, then cb: @escaping (_ : [Cheer]) -> Void) -> [Cheer]{
        var tempCheers : [Cheer] = []
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
                    tempCheers.append(tempCheer)
                    }
                }
            }
            self.arrOfCheers = tempCheers
            cb(tempCheers)
        }) { (error) in
            print(error.localizedDescription)
        }
        return tempCheers
    }
    
    // MARK: Subscription functions
    func userSubscribe(to user : String, then cb: @escaping () -> Void) {
        // Subscription is an addition to their sub list and yours
        let pushKey = ref.child("users").child(myProfile.displayName!).child("subscribedTo").childByAutoId().key
        if (user != "") {
            ref.child("users").child(myProfile.displayName!).child("subscribedTo").child(pushKey).setValue(user){ (error, reference) -> Void in
                if let error = error {
                    print("Data could not be saved: \(error).")
                } else {
                    print("Data saved successfully!")
                }
                
            }
        }
        
    }
}
