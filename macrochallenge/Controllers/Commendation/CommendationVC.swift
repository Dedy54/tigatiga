//
//  CommendationVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 12/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class CommendationVC: UIViewController {
    
    
    @IBOutlet var starButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        for button in starButton{
            if button.tag <= sender.tag {
                button.setImage(UIImage(named: "Star"), for: .normal)
            }else{
                button.setImage(UIImage(named: "StarTransparent"), for: .normal)
            }
        }
    }
    
    
    
    

}
