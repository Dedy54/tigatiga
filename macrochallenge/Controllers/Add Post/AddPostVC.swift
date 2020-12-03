//
//  AddPostVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 10/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var postButton: UIButton!
    
    var addPostPlayer = AddPostLFMemberVC()
    var addPostTeam = AddPostLFGroupVC()
    
    var views : [UIView]!
    
    let postInteractor: PostInteractor? = PostInteractor()
    var selectedPeople: Player?
    var selectedView: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTapped()
        segmentedControl.frame.size.height = 40
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        
        overrideUserInterfaceStyle = .dark
        setSegmentedViewInContainer()
        
        postButton.layer.cornerRadius = 15
        
        extendedLayoutIncludesOpaqueBars = true
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    func setSegmentedViewInContainer(){
        views = [UIView]()
//        views.append(addPostPlayer.view)
        views.append(addPostTeam.view)
//
//        for v in views {
//            viewContainer.addSubview(v)
//        }
//
//        viewContainer.bringSubviewToFront(views[0])
        
        viewContainer.addSubview(addPostTeam.view)
        
        extendedLayoutIncludesOpaqueBars = true
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
    }
    
    
    @IBAction func postTapped(_ sender: Any) {
        if views[selectedView!] == addPostPlayer.view {
            let teamName =  addPostPlayer.teamNameTextfield.text
            let description = addPostPlayer.descriptionTextview.text
            let postTemp = Post(id: teamName, name: description, creator: selectedPeople)
            postInteractor?.createPost(post: postTemp, success: { (postResult) -> (Void) in
                print("call post interactor with data ", postResult)
                self.performSegue(withIdentifier: "unwindAddSegue", sender: nil)
            }, failure: { (err) -> (Void) in
                print("failed to add post data with error \(err)")
            })
        }else{
            let availability =  addPostTeam.availability.text
            let description = addPostTeam.descriptionTextview.text
            let postTemp = Post(id: availability, name: description, creator: selectedPeople)
            postInteractor?.createPost(post: postTemp, success: { (postResult) -> (Void) in
                print("call post interactor with data ", postResult)
                self.performSegue(withIdentifier: "unwindAddSegue", sender: nil)
            }, failure: { (err) -> (Void) in
                print("failed to add post data with error \(err)")
            })
        }
    }
    
}
