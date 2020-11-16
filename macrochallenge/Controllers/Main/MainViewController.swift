//
//  MainViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 07/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {
    
//    var teamInteractor: TeamInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
//        teamInteractor = TeamInteractor()
//        teamInteractor?.fetchMyTeams(success: { (teams) -> (Void) in
//            print("aaaaaaaa \(teams)")
//        }, failure: { (error) -> (Void) in
//            print(error)
//        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
    
    override var selectedIndex: Int {
        didSet {
            super.selectedIndex = selectedIndex
        }
    }
    
}
