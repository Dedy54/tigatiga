//
//  EditProfileViewController.swift
//  macrochallenge
//
//  Created by Bryanza on 16/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    private let indicator = UIActivityIndicatorView()
    
    var selectedPeople: Player?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileUsername: UITextField!
    @IBOutlet weak var profileGame: UITextField!
    @IBOutlet weak var profileSkillRating: UITextField!
    @IBOutlet weak var profileRole: UITextField!
    @IBOutlet weak var profileExperience: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        retreiveData()
        // Do any additional setup after loading the view.
    }
    
    func retreiveData() {
        profileUsername.text = selectedPeople?.name
        profileGame.text = selectedPeople?.game
        profileSkillRating.text = selectedPeople?.skillRating
        profileRole.text = selectedPeople?.role
        profileExperience.text = selectedPeople?.experience
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupActivityIndicator() {
        indicator.style = .medium
        indicator.hidesWhenStopped = true
        indicator.backgroundColor = .white
        indicator.frame = self.view.frame
        self.view.addSubview(indicator)
    }

}
