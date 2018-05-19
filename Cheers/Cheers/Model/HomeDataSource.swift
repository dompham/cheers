//
//  HomeDataSource.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

class HomeDatasource : Datasource {
    let cheers : [Cheer] = {
        let recentCheer1 = Cheer(name: "dompham", beer: "Sculpin IPA", location: "@ The Ugly Dog", review: "Beer was OK, but I prefer the grapefruit version.", profileImage: #imageLiteral(resourceName: "dpham_stub_pic") )
        let recentCheer2 = Cheer(name: "hmykel", beer: "Cali Creamin", location: "@ Bridges", review: "Beer was OK, but I prefer the grapefruit version. I need to make this review longer longer longer to test how the app looks when someone has a ridiculous amount to say about a beer. What is there to say but that it was refreshing and got me lit like a lantern.  It had a nice color and was good on the pallette. I'm not sure if thats how you correctly spell pallette.", profileImage: #imageLiteral(resourceName: "dpham_stub_pic"))
        return [recentCheer1, recentCheer2]
    }()
    
    //let words = ["Belching Beaver Stout", "Grapefruit Sculpin IPA"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [RecentHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [RecentBeerCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [RecentFooter.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return cheers[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return cheers.count
    }
}
