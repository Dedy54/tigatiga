//
//  profileForMeVC.swift
//  macrochallenge
//
//  Created by Bryanza on 11/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class profileForMeVC: UIViewController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var profileBackground: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileGame: UILabel!
    @IBOutlet weak var profileSkill: UILabel!
    @IBOutlet weak var profileRole: UILabel!
    @IBOutlet weak var profileJoin: UILabel!
    @IBOutlet weak var profileExperience: UITextField!
    @IBOutlet weak var inviteButton: UIButton!
    @IBOutlet weak var commendButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    var selectedPlayer: Player?
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPlayer()
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        let editProfile = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        
        self.navigationController?.pushViewController(editProfile, animated: true)
    }
    @IBAction func chatPeople(_ sender: UIButton) {
    }
    @IBAction func commendPeople(_ sender: UIButton) {
    }
    func setupPlayer() {
        if selectedPlayer?.id == Auth.auth().currentUser?.uid ?? "0" {
            inviteButton.isHidden = true
            commendButton.isHidden = true
            editButton.isHidden = false
        }else {
            inviteButton.isHidden = false
            commendButton.isHidden = false
            editButton.isHidden = true
        }
        profileSkill.text = selectedPlayer?.skillRating
        profileRole.text = selectedPlayer?.role
        profileGame.text = selectedPlayer?.game
        profileExperience.text = selectedPlayer?.experience
    }
}
