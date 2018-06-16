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
    
    // MARK: User Profile Functions
    func initMyProfile(then cb: @escaping () -> Void){
        ref.child("users").child(myProfile.displayName).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            if let resources = snapshot.value as? [String : AnyObject] {
                //for (_, obj) in resources {
                    //if let dataObject = obj as? [String : AnyObject] {
                        myProfile.displayName =  resources["displayName"] as! String;
                        myProfile.email = resources["email"] as! String;
                        myProfile.uid = resources["uid"] as! String;
                        //myProfile.subscribedTo = dataObject["subscribedTo"] as! String;
//                        myProfile.subscribers = dataObject["subscribers"] as! String;
                  //  }
               // }
            }
            cb()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func getDisplayName(for email: String, then cb: @escaping (_ : String) -> Void){
        ref.child("nameEmailMaps").observeSingleEvent(of: .value, with: { (snapshot) in
            if let resources = snapshot.value as? [String : AnyObject] {
                let displayName = (resources as NSDictionary).allKeys(for: email) as! String
            }
        })
    }
    
    
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
        let subscribedToKey = ref.child("users").child(myProfile.displayName).child("subscribedTo").childByAutoId().key
        let subscriberKey = ref.child("users").child(user).child("subscribers").childByAutoId().key

        if (user != "") {
            // Update my list
            ref.child("users").child(myProfile.displayName).child("subscribedTo").child(subscribedToKey).setValue(user){ (error, reference) -> Void in
                if let error = error {
                    print("Data could not be saved: \(error).")
                } else {
                    print("Data saved successfully!")
                    // Update local list
                    myProfile.subscribedTo.append(user)
                    // Update other list
                    self.ref.child("users").child(user).child("subscribers").child(subscriberKey).setValue(myProfile.displayName)
                }
                
            }
        }
    }
}
