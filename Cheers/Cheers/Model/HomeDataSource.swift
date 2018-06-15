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
    
    
    let recentCheers : [RecentCheer] = {
        let recentCheer1 = RecentCheer(name: "dompham", beer: "Sculpin IPA", location: "@ The Ugly Dog", review: "Beer was OK, but I prefer the grapefruit version.", profileImage: #imageLiteral(resourceName: "dpham_stub_pic") )
        return [recentCheer1]
    }()
    
    var feedCheers : [Cheer] = [] //= {

    

    
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
