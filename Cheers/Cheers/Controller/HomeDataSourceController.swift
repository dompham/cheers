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
        collectionView?.backgroundColor = UIColor(r: 255, g: 245, b: 232)
        collectionView?.showsVerticalScrollIndicator = false
        setupNavigationBarItems()
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: Nav Bar
    private func setupNavigationBarItems(){
        
        // MARK: Nav Title
        
        let titleImage = UIImageView(image: #imageLiteral(resourceName: "main_icon"))
//        let titleImage = UIImageView(image: #imageLiteral(resourceName: "beer_cheers"))

        
       // titleImage.frame = CGRect(x: 0, y: 5, width: 20, height: 20)
        
        let widthTitle = titleImage.widthAnchor.constraint(equalToConstant: 36)
        let heightTitle = titleImage.heightAnchor.constraint(equalToConstant: 36)
        heightTitle.isActive = true
        widthTitle.isActive = true
        
        titleImage.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImage

        
        // MARK: Search Button
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search"), for: .normal)
        // iOS 11 buttons need constraints
        let widthConstraintSearch = searchButton.widthAnchor.constraint(equalToConstant: 28)
        let heightConstraintSearch = searchButton.heightAnchor.constraint(equalToConstant: 28)
        heightConstraintSearch.isActive = true
        widthConstraintSearch.isActive = true
        searchButton.contentMode = .scaleAspectFit
        
        // MARK: Settings Button
        
        let settingsButton = UIButton(type: .system)
        settingsButton.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        // iOS 11 buttons need constraints
        let widthConstraintSettings = settingsButton.widthAnchor.constraint(equalToConstant: 28)
        let heightConstraintSettings = settingsButton.heightAnchor.constraint(equalToConstant: 28)
        heightConstraintSettings.isActive = true
        widthConstraintSettings.isActive = true
        settingsButton.contentMode = .scaleAspectFit
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: settingsButton), UIBarButtonItem(customView: searchButton)]
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        let navBarSeparator = UIView()
        navBarSeparator.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparator)
        navBarSeparator.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    // MARK: Cell Setup
    //Cell height
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let recentCheer = self.datasource?.item(indexPath) as? RecentCheer {
            // Dynamic height for review
            let approxWidth = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approxWidth, height: 1000)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            let estimateFrame = NSString(string: recentCheer.review).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            print(estimateFrame.height)
            return CGSize(width: view.frame.width, height: estimateFrame.height + 90)
        }
        return CGSize(width: view.frame.width, height: 500)
    }
    
    //MARK: Header footer sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 1) {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 1) {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
