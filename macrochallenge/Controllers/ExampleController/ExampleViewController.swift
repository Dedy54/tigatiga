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
        
        var a: UserInteractor?
        a = UserInteractor()
        a?.fetchUsers(success: { (users) -> (Void) in
            print("users : \(users)")
        }) { (error) -> (Void) in
            print("\(error)")
        }
        
        let b: AuthInteractor?
        b = AuthInteractor()
        b?.registerWithEmail(email: "dedyy54@gmail.com", password: "12341234R", success: { (authDataResult) -> (Void) in
            print("authDataResult : \(authDataResult)")
        }, failure: { (error) -> (Void) in
            print("error \(error)")
        })
        let c = SignInViewController.instantiateViewController()
        self.navigationController?.pushViewController(c, animated: true)
    }
    
    func callSecondExampleViewController() {
        let foodListViewController = ExampleViewController.instantiateViewController()
        present(foodListViewController, animated: false, completion: nil)
    }

}
