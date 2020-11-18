//
//  PostDetailMemberVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 11/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class PostDetailMemberVC: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var avgSkillTitleLabel: UILabel!
    @IBOutlet weak var memberTiltleLabel: UILabel!
    
    
    @IBOutlet weak var searchinForLabel: UILabel!
    @IBOutlet weak var skillRatingTitleLabel: UILabel!
    @IBOutlet weak var availabilityTitleLabel: UILabel!
    @IBOutlet weak var roleTitleLabel: UILabel!
    
    @IBOutlet weak var avgSkillLabel: UILabel!
    @IBOutlet weak var memberLabel: UILabel!
    
    
    @IBOutlet weak var skillRatingTextview: UITextView!
    
    @IBOutlet weak var roleRatingTextview: UITextView!
    
    @IBOutlet weak var availabilityTextview: UITextView!
    
    
    @IBOutlet weak var joinButton: UIButton!
    
    var selectedPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Looking For Member"
        
        overrideUserInterfaceStyle = .dark
        
        setTextviewShape(txtview: skillRatingTextview)
        setTextviewShape(txtview: roleRatingTextview)
        setTextviewShape(txtview: availabilityTextview)
        
       setFont()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        
        joinButton.layer.cornerRadius = 15
        
        populatePost()
    }
    
    func populatePost() {
        skillRatingTextview.text = selectedPost?.creator?.skillRating
        roleRatingTextview.text = selectedPost?.creator?.role
        availabilityTextview.text = selectedPost?.id
    }
    
    func setFont(){
        teamNameLabel.font = UIFont(name: "Hind-Bold", size: 16)
        avgSkillTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        memberTiltleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        searchinForLabel.font = UIFont(name: "Hind-Bold", size: 12)
        skillRatingTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        roleTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        availabilityTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        avgSkillLabel.font = UIFont(name: "Hind-Regular", size: 12)
        memberLabel.font = UIFont(name: "Hind-Regular", size: 12)
    }
    
    
    
    func setTextviewShape(txtview : UITextView){
        txtview.layer.borderWidth = 1
        txtview.layer.borderColor = searchForTeamVC().mabarYellow
        txtview.layer.cornerRadius = 5
        
    }

}
