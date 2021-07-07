//
//  profileMenuViewController.swift
//  macrochallenge
//
//  Created by Bryanza on 16/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import UIKit

class profileMenuViewController: UIViewController {
    
    var lastViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func instantiateSheetViewController(isCanDismiss: Bool, lastViewController: UIViewController) -> SheetViewController {
        let controller = profileMenuViewController(nibName: "profileMenuViewController", bundle: nil)
        controller.lastViewController = lastViewController
        let sheetController = SheetViewController(controller: controller, sizes: [.fixed(540)])
        sheetController.dismissable = isCanDismiss
        sheetController.adjustForBottomSafeArea = false
        sheetController.blurBottomSafeArea = false
        sheetController.dismissOnBackgroundTap = true
        sheetController.extendBackgroundBehindHandle = false
        sheetController.topCornersRadius = 20
        sheetController.willDismiss = { _ in print("Will dismiss ")}
        sheetController.didDismiss = { _ in print("Will dismiss ")}
        return sheetController
    }
    
    @IBAction func logoutUser(_ sender: UIButton) {
        PreferenceManager.instance.isLogin = false
        self.performSegue(withIdentifier: "logoutToFeed", sender: nil)
    }
    
}
