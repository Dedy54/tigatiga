//
//  ExampleViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 07/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    static func instantiateViewController() -> ExampleViewController {
        let controller = R.storyboard.example.exampleViewController()!
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func callSecondExampleViewController() {
        let foodListViewController = ExampleViewController.instantiateViewController()
        present(foodListViewController, animated: false, completion: nil)
    }

}
