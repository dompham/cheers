//
//  HomeDataSource.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

class HomeDatasource : Datasource {
    let words = ["IPA", "Pilsner", "Lager"]
    
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
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
