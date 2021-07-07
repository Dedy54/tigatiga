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
    @IBOutlet weak var editImageButton: UILabel!
    
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    @IBOutlet weak var imageCorner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Edit Profile"
        retreiveData()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton
        let editImage = UITapGestureRecognizer(target: self, action: #selector(generateRandomImage))
        editImageButton.addGestureRecognizer(editImage)
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
    
    @objc func generateRandomImage(){
        let (image, name) = AvatarPicture.selectImage()
        profileImage.image = image
        selectedPeople?.imageProfile = name
    }
    
    @objc func back() {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        selectedPeople?.name = profileUsername.text
        selectedPeople?.game = profileGame.text
        selectedPeople?.skillRating = profileSkillRating.text
        selectedPeople?.role = profileRole.text
        selectedPeople?.experience = profileExperience.text
        playerInteractor?.updatePlayer(player: selectedPeople!, success: { (updatedPlayer) -> (Void) in
            print("success to update player with data \(updatedPlayer)")
        }, failure: { (err) -> (Void) in
            print("failed to update player data with error \(err)")
        })
        self.navigationController?.popViewController(animated: true)
        
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
        if selectedPeople?.imageProfile == "" {
            profileImage.image = AvatarPicture.random()
        }else{
            profileImage.image = #imageLiteral(resourceName: selectedPeople!.imageProfile!)
        }
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
