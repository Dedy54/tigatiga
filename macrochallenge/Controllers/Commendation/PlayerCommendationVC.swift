//
//  PlayerCommendationVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 12/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class PlayerCommendationVC: UIViewController {


    
    var commendationview = CommendationVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commendationview.view.center = CGPoint(x: view.frame.size.width  / 2,
                                     y: view.frame.size.height / 2)
        view.addSubview(commendationview.view)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
