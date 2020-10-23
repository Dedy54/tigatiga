//
//  SecondExampleViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 07/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class SecondExampleViewController: UIViewController {

    static func instantiateViewController() -> SecondExampleViewController {
        let controller = SecondExampleViewController(nib: R.nib.secondExampleViewController)
        return controller
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func callExampleViewController() {
        let foodListViewController = ExampleViewController.instantiateViewController()
        present(foodListViewController, animated: false, completion: nil)
    }

}
