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
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var commendButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var mvpCommendation: UIButton!
    @IBOutlet weak var teamLeaderCommendation: UIButton!
    @IBOutlet weak var friendlyCommendation: UIButton!
    @IBOutlet weak var teamPlayerCommendation: UIButton!
    
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var commendationView: UIView!
    
    
    var selectedPlayer: Player?
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPlayer()
        
        setBorder()
        setFont()
        extendedLayoutIncludesOpaqueBars = true
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        let editProfile = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        editProfile.selectedPeople = selectedPlayer
        
        self.navigationController?.pushViewController(editProfile, animated: true)
    }
    @IBAction func chatPeople(_ sender: UIButton) {
    }
    @IBAction func commendPeople(_ sender: UIButton) {
        let playerCommendation = UIStoryboard.init(name: "PlayerCommendation", bundle: nil)
        let commendPlayerVC = playerCommendation.instantiateViewController(identifier: "commendPlayerVC") as! PlayerCommendationVC
        commendPlayerVC.selectedPeople = selectedPlayer
        commendPlayerVC.transitioningDelegate = self
        commendPlayerVC.modalPresentationStyle = .custom
        commendPlayerVC.modalTransitionStyle = .coverVertical
        commendPlayerVC.view.layer.cornerRadius = 34
        self.present(commendPlayerVC, animated: true, completion: nil)
    }
    
    func setBorder(){
        profileBackground.layer.cornerRadius = 10
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        detailView.layer.cornerRadius = 10
        
        profileExperience.layer.borderWidth = 1
        profileExperience.layer.borderColor = searchForTeamVC().mabarYellow
        profileExperience.layer.cornerRadius = 5
        
        commendationView.layer.cornerRadius = 5
        commendationView.layer.borderWidth = 1
        commendationView.layer.borderColor = searchForTeamVC().mabarYellow
        
        chatButton.layer.cornerRadius = 20
        commendButton.layer.cornerRadius = 20
        editButton.layer.cornerRadius = 20
    }
    
    func setFont(){
        
    }
    
    func setupPlayer() {
        if selectedPlayer?.id == Auth.auth().currentUser?.uid ?? "0" {
            chatButton.isHidden = true
            commendButton.isHidden = true
            editButton.isHidden = false
        }else {
            chatButton.isHidden = false
            commendButton.isHidden = false
            editButton.isHidden = true
        }
        profileSkill.text = selectedPlayer?.skillRating
        profileRole.text = selectedPlayer?.role
        profileGame.text = selectedPlayer?.game
        profileExperience.text = selectedPlayer?.experience
        if selectedPlayer!.commendations != nil {
            for commendation in selectedPlayer!.commendations! {
                if commendation.id == "\(commendations.mvp)" {
                    mvpCommendation.isHidden = false
                }
                else if commendation.id == "\(commendations.teamleader)" {
                    teamLeaderCommendation.isHidden = false
                }
                else if commendation.id == "\(commendations.teamplayer)" {
                    teamPlayerCommendation.isHidden = false
                }else {
                    friendlyCommendation.isHidden = false
                }
            }
        }
    }
}

extension profileForMeVC:  UIActionSheetDelegate, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return OverlayPresentationController(presentedViewController:presented, presenting:presenting)
    }
}
