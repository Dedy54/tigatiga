//
//  Onboarding4VC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 16/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class Onboarding4VC: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        continueButton.layer.cornerRadius = 20
    }
    
    
    @IBAction func continueTapped(_ sender: Any) {
        // set not new user
//        Core.shared.setIsNotNewUser()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! UITabBarController

        self.present(mainVC,animated: true,completion: nil)
        
    }
    
}

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
    
    func setIsNewUser(){
        UserDefaults.standard.set(false, forKey: "isNewUser")
    }
}
