//
//  HomeDataSource.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents
import Firebase

class HomeDatasource : Datasource {
    
    let DBservice = DatabaseService.sharedInstance
    
    let recentCheers : [RecentCheer] = {
        let recentCheer1 = RecentCheer(name: "dompham", beer: "Sculpin IPA", location: "@ The Ugly Dog", review: "Beer was OK, but I prefer the grapefruit version.", profileImage: #imageLiteral(resourceName: "dpham_stub_pic") )
//        let recentCheer2 = Cheer(name: "hmykel", beer: "Cali Creamin", location: "@ Bridges", review: "What is there to say but that it was refreshing and got me lit like a lantern.", profileImage: #imageLiteral(resourceName: "hmykel"))
        return [recentCheer1]
    }()
    
    var feedCheers : [Cheer] = [] //= {
//        let cheer1 = Cheer(name: "oramos", beer: "Coffee Stout", location: "@ The Ugly Dog", review: "Have to drink something heavy first then ease into something light.", profileImage: #imageLiteral(resourceName: "oramos"))
//        let cheer2 = Cheer(name: "hmykel", beer: "Cali Creamin", location: "@ Bridges", review: "What is there to say but that it was refreshing and got me lit like a lantern.", profileImage: #imageLiteral(resourceName: "hmykel"))
//        let cheer3 = Cheer(name: "oramos", beer: "Spaten Lager", location: "@ My Place", review: "Easy to drink German beer.", profileImage: #imageLiteral(resourceName: "oramos"))
//        let cheer4 = Cheer(name: "hmykel", beer: "Guinness Stout", location: "@ Clems", review: "Beer was very dense and felt like a full meal.  Definitely not one to drink with a ton of food.", profileImage: #imageLiteral(resourceName: "hmykel"))
//        return [cheer1, cheer2, cheer3, cheer4]
//    }()
    

    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [RecentHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [RecentBeerCell.self, FeedViewCall.self ]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [RecentFooter.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {

        if indexPath.section == 1 {
            return myProfile.feedCheers[indexPath.item]
        }
        return recentCheers[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if (section == 1) {
            return myProfile.feedCheers.count
        }
        return recentCheers.count
    }
}
