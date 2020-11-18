//
//  FeedVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 05/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class FeedVC: UIViewController{

    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var recommendationTitleLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    
    
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
    let postInteractor: PostInteractor? = PostInteractor()
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    var currentPlayer: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        overrideUserInterfaceStyle = .dark
        recommendedCollectionView.dataSource = self
        recommendedCollectionView.delegate = self
        feedTableView.dataSource = self
        feedTableView.delegate = self
        
        recommendationTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        postTitleLabel.font = UIFont(name: "Hind-Bold", size: 12)
        setUIBarItemLeft()
        setUIBarItemRight()
        
        getPost()
        
    }
    
    
    func getPost() {
        postInteractor?.fetchPosts(success: { (postResults) -> (Void) in
            self.posts = postResults
            self.feedTableView.reloadData()
        }, failure: { (err) -> (Void) in
            print("failed to get post data with error \(err)")
        })
    }
    
    func setUIBarItemLeft(){
        let leftItem = UIBarButtonItem(title: "Post",
                                       style: UIBarButtonItem.Style.plain,
                                           target: nil,
                                           action: nil)
        leftItem.isEnabled = false
        leftItem.tintColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func setUIBarItemRight() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageview.image = UIImage(named: "pp")
        imageview.contentMode = UIView.ContentMode.scaleAspectFill
        imageview.layer.cornerRadius = 20
        imageview.layer.masksToBounds = true
        containView.addSubview(imageview)
        let profileTap = UITapGestureRecognizer(target: self, action: #selector(ppTouched))
        containView.addGestureRecognizer(profileTap)
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func ppTouched(){
        playerInteractor?.currentPlayer(success: { (playerResult) -> (Void) in
            self.currentPlayer = playerResult
            self.performSegue(withIdentifier: "profileSegue", sender: nil)
        }, failure: { (err) -> (Void) in
            print("failed to current player data with error \(err)")
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue"
        {
            let profilePeopleVC = segue.destination as! profilePeopleVC
            profilePeopleVC.selectedPeople = currentPlayer
        }
    }
    
    @IBAction func unwindToFeedPost(_ unwindSegue: UIStoryboardSegue) {
//        if unwindSegue.source is AddPostVC {
//        }else
        if unwindSegue.source is FilterPostViewController {
            
        }
        feedTableView.reloadData()
        // Use data from the view controller which initiated the unwind segue
    }

}

extension FeedVC : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as! RecommendedCollectionViewCell
        
        cell.recommendedImage.image = photo[indexPath.item]
        cell.recommendedImage.layer.cornerRadius = cell.recommendedImage.frame.height / 2
        
        return cell
    }
}

extension FeedVC: UITableViewDelegate,UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.postView.layer.cornerRadius = 10
        
        cell.feedProfileImage.image = UIImage(named: "pp")
        cell.feedProfileImage.layer.cornerRadius = cell.feedProfileImage.frame.height / 2
        
        cell.feedNameLabel.text = posts[indexPath.row].name
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
    }
    
}
