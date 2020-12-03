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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        retreiveData()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton
        let editImage = UITapGestureRecognizer(target: self, action: #selector(generateRandomImage))
        editImageButton.addGestureRecognizer(editImage)
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
