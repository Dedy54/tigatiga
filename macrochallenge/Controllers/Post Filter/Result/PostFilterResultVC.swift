//
//  PostFilterResultVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 11/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class PostFilterResultVC: UIViewController {

    @IBOutlet weak var postResultTableView: UITableView!
    
    let photo :[UIImage] =
        [UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,
         UIImage(named: "pp")!,]
    
    var posts: [Post] = []
    var selectedPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postResultTableView.delegate = self
        postResultTableView.dataSource = self
        overrideUserInterfaceStyle = .dark

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetailMember"
        {
            let detailMemberVC = segue.destination as! PostDetailMemberVC
            detailMemberVC.selectedPost = selectedPost
        }
        else if segue.identifier == "segueDetailTeam"
        {
            let detailTeamVC = segue.destination as! PostDetailTeamVC
            detailTeamVC.selectedPost = selectedPost
        }
    }

}

extension PostFilterResultVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! PostFilterResultTableViewCell
        
        cell.postView.layer.cornerRadius = 10
        
        cell.feedProfileImage.image = UIImage(named: "pp")
        cell.feedProfileImage.layer.cornerRadius = cell.feedProfileImage.frame.height / 2
        
        cell.feedNameLabel.text = "@PlayerorTeamName"
        cell.feedNameLabel.font = UIFont(name: "Hind-Bold", size: 12)
        
        if posts[indexPath.row].creator!.lookingForGroup! {
            cell.feedLookingForLabel.text = "Looking For Group"
        }else {
            cell.feedLookingForLabel.text = "Looking For Member"
        }
        cell.feedLookingForLabel.font = UIFont(name: "Hind-Bold", size: 24)
        
        cell.skillRatingLabel.text = posts[indexPath.row].creator?.skillRating
        cell.skillRatingLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        cell.roleLabel.text = posts[indexPath.row].creator?.role
        cell.roleLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        cell.availibilityLabel.text = "Mon, 20.00-23.00"
        cell.availibilityLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        cell.skillRatingTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        cell.availabilityTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        cell.roleTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        selectedPost = posts[indexPath.row]
        if posts[indexPath.row].creator!.lookingForGroup! {
            self.performSegue(withIdentifier: "segueDetailMember", sender: nil)
        }else {
            self.performSegue(withIdentifier: "segueDetailTeam", sender: nil)
        }
    }
    
}
