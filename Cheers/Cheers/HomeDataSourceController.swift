//
//  HomeDataSourceController.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .gray;
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
}
