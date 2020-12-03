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
    @IBOutlet weak var profileExperience: UITextView!
    @IBOutlet weak var imageCorner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Edit Profile"
        retreiveData()
        // Do any additional setup after loading the view.
        imageCorner.layer.cornerRadius = imageCorner.frame.height / 2
        
        setTextFieldShape2(txtfld: profileUsername)
        setTextFieldShape2(txtfld: profileGame)
        setTextFieldShape2(txtfld: profileSkillRating)
        setTextFieldShape2(txtfld: profileRole)
        
        profileExperience.layer.borderWidth = 0.5
        profileExperience.layer.borderColor = searchForTeamVC().mabarYellow
        profileExperience.layer.cornerRadius = 5
        
        overrideUserInterfaceStyle = .dark
        
        extendedLayoutIncludesOpaqueBars = true
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    public func setTextFieldShape2(txtfld : UITextField){
        txtfld.layer.borderWidth = 0.5
        txtfld.layer.borderColor = searchForTeamVC().mabarYellow
        txtfld.layer.cornerRadius = 5
        txtfld.frame.size.height = 44
        txtfld.tintColor = .clear
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
