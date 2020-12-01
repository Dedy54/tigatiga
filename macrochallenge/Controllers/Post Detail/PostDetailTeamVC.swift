//
//  PostDetailTeamVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 11/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class PostDetailTeamVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var memberNameLabel: UILabel!
    
    @IBOutlet weak var skillTitleLabel: UILabel!
    @IBOutlet weak var roleTitleLabel: UILabel!
    
    
    @IBOutlet weak var searchinForLabel: UILabel!
    @IBOutlet weak var avgSkillRatingTitleLabel: UILabel!
    @IBOutlet weak var availabilityTitleLabel: UILabel!

    
    @IBOutlet weak var skillRatingLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    
    @IBOutlet weak var avgSkillRatingTextview: UITextView!
    @IBOutlet weak var availabilityTextview: UITextView!
    
    
    @IBOutlet weak var inviteButton: UIButton!
    
    var selectedPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Looking For Group"
        overrideUserInterfaceStyle = .dark
        
        setTextviewShape(txtview: avgSkillRatingTextview)
        setTextviewShape(txtview: availabilityTextview)
        
       setFont()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        
        inviteButton.layer.cornerRadius = 15
        
        populatePost()
    }
    
    func populatePost() {
        avgSkillRatingTextview.text = selectedPost?.creator?.skillRating
        availabilityTextview.text = selectedPost?.id
        if selectedPost?.creator?.imageProfile == "" {
            profileImage.image = AvatarPicture.random()
        }else {
            profileImage.image = #imageLiteral(resourceName: (selectedPost?.creator!.imageProfile)!)
        }
    }
    
    func setFont(){
        memberNameLabel.font = UIFont(name: "Hind-Bold", size: 16)
        skillTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        roleTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        searchinForLabel.font = UIFont(name: "Hind-Bold", size: 12)
        avgSkillRatingTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        availabilityTitleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        skillRatingLabel.font = UIFont(name: "Hind-Regular", size: 12)
        roleLabel.font = UIFont(name: "Hind-Regular", size: 12)
    }
    
    func setTextviewShape(txtview : UITextView){
        txtview.layer.borderWidth = 1
        txtview.layer.borderColor = searchForTeamVC().mabarYellow
        txtview.layer.cornerRadius = 5
        
    }
    

}
