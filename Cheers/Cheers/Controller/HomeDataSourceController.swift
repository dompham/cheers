//
//  HomeDataSourceController.swift
//  Cheers
//
//  Created by Do Pham on 5/18/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import LBTAComponents
import Firebase
import FirebaseDatabase
import FirebaseAuth
import RxSwift
import RxGesture

class HomeDatasourceController: DatasourceController {
    var handle: AuthStateDidChangeListenerHandle?;
    let disposeBag = DisposeBag()
    var ref: DatabaseReference!
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Init db
        ref = Database.database().reference()
        collectionView?.backgroundColor = UIColor(r: 221, g: 245, b: 255)
        collectionView?.showsVerticalScrollIndicator = false
        setupNavigationBarItems()
        setupRefresh()
        // Fetch and set data source
        fetchFeed()
    }
    
    func fetchFeed() {
        _ = DBservice.getPosts(for: myProfile.displayName) { (arrCheers) in
            logService.log(volume: 2, say: "Fetched feed and updating home data source")
            myProfile.feedCheers = arrCheers
            let homeDatasource = HomeDatasource()
            self.datasource = homeDatasource
        }
    }
    
    func setupRefresh() {
        refreshControl = self.getRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        refreshControl.tag = 8
        collectionView!.addSubview(refreshControl)
    }
    
    @objc func refresh(){
        updateFeed(then: stopRefreshing)
    }
    
    func updateFeed(then cb: @escaping () -> Void){
        DBservice.getPosts(for: myProfile.displayName) { (arrCheers) in
            logService.log(volume: 2, say: "Updating home feed")
            myProfile.feedCheers = arrCheers
                cb()
            self.collectionView?.reloadData()
        }
    }
    
    func stopRefreshing(){
        self.refreshControl.endRefreshing()
        self.activityIndicatorView.stopAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {

            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: Nav Bar
    private func setupNavigationBarItems(){

        let titleImage = UIImageView(image: #imageLiteral(resourceName: "main_icon"))
        let widthTitle = titleImage.widthAnchor.constraint(equalToConstant: 36)
        let heightTitle = titleImage.heightAnchor.constraint(equalToConstant: 36)
        heightTitle.isActive = true
        widthTitle.isActive = true
        
        titleImage.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImage
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = cheersBlue
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]

        navigationItem.title = "Home"
        
        // MARK: Search Button
        
        let searchButton = UIButton(type: .system)

        searchButton.setImage(#imageLiteral(resourceName: "search"), for: .normal)
        searchButton.tintColor = cheersOrange
        // iOS 11 buttons need constraints
        let widthConstraintSearch = searchButton.widthAnchor.constraint(equalToConstant: 28)
        let heightConstraintSearch = searchButton.heightAnchor.constraint(equalToConstant: 28)
        heightConstraintSearch.isActive = true
        widthConstraintSearch.isActive = true
        searchButton.contentMode = .scaleAspectFit
        // MARK: Search button temporarily create post
            searchButton.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                
//
//                print("domp: Creating post")
//                let key = self.ref.child("posts").child("dompham").childByAutoId().key
//                let newCheer = [
//                    "name": "dompham" as String,
//                    "beer": "yet another beer" as String,
//                    "location": "Some bar" as String,
//                    "review": "It was not as great" as String,
//                    "author": "Do Testing" as String,
//                    "timestamp": "Timestamp" as String,
//                    "key": key as String
//                ]
//                // Adding to post tree
//                self.ref.child("posts").child("dompham").child(key).setValue(newCheer)

               
            }).disposed(by: disposeBag)
        
        
        // MARK: Settings Button
        
        let settingsButton = UIButton(type: .system)
        settingsButton.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                do{
                    try Auth.auth().signOut()
                    let loginView = LoginViewController()
                    loginView.modalTransitionStyle = .coverVertical
                    self.present(loginView, animated: true, completion: { () in
                        
                    })
                } catch let err{
                    logService.log(volume: 1, say: "Error Loggin out: " + err.localizedDescription)
                }
            }).disposed(by: disposeBag)
        
        settingsButton.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        settingsButton.tintColor = cheersOrange
        // iOS 11 buttons need constraints
        let widthConstraintSettings = settingsButton.widthAnchor.constraint(equalToConstant: 28)
        let heightConstraintSettings = settingsButton.heightAnchor.constraint(equalToConstant: 28)
        heightConstraintSettings.isActive = true
        widthConstraintSettings.isActive = true
        settingsButton.contentMode = .scaleAspectFit
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: settingsButton), UIBarButtonItem(customView: searchButton)]
        
        navigationController?.navigationBar.shadowImage = UIImage()
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        //navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        let navBarSeparator = UIView()
        navBarSeparator.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparator)
        navBarSeparator.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    // MARK: Cell Setup
    //Cell height
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // If recent cheer size this way otherwise its feed cheer size that way
        if let recentCheer = self.datasource?.item(indexPath) as? RecentCheer {
            // Dynamic height for review
            let approxWidth = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approxWidth, height: 1000)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            let estimateFrame = NSString(string: recentCheer.review).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimateFrame.height + 90)
            
        } else if let cheer = self.datasource?.item(indexPath) as? Cheer {
            // Dynamic height for review
            let approxWidth = view.frame.width - 12 - 50 - 12 - 2
//            let size = CGSize(width: approxWidth, height: 1000)
//            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            //String estimation
//            let estimateFrame = NSString(string: cheer.review).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
//            let estimatedHeight = estimateFrame.height + 445
           
            let estimatedHeight = CGFloat(480.0)

//            let estimatedHeight = CGFloat(525)

            
            logService.log(volume: 3, say: "Estimated height: \(estimatedHeight)" )

            return CGSize(width: view.frame.width - 20, height: estimatedHeight)
            
        }
        return CGSize(width: view.frame.width, height: 200)
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
        return CGSize(width: view.frame.width, height: 54)
    }
}
