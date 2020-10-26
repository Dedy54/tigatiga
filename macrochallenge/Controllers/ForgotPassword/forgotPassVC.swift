//
//  forgotPassVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 20/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit
import Firebase

class forgotPassVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.placeholder = "Email"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailResetBtnTapped(_ sender: Any) {
        
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTextField.text!) { [self] (error) in
            if let error = error {
                let alert = self.createAlertController(title:"error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = self.createAlertController(title:"Success", message: "Your password has been reset")
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func createAlertController(title:String, message:String) -> UIAlertController {
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        return alert
    }
    

}
