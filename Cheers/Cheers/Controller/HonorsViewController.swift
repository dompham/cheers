//
//  HonorsViewController.swift
//  Cheers
//
//  Created by Do Pham on 5/21/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import ALCameraViewController

class HonorsViewController : UIViewController {
    var cameraViewController : CameraViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraViewController = CameraViewController { [weak self] image, asset in
            // Do something with your image here.
            self?.dismiss(animated: true, completion: {
                // Return to home
                self?.tabBarController!.selectedIndex = 0
            })
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        logService.log(volume: 2, say: "Presenting Camera")
        present(cameraViewController, animated: true, completion: nil)

    }
}
