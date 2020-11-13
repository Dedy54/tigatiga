//
//  CommendationInfoVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 12/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class CommendationInfoVC: UIViewController {
    
    @IBOutlet weak var commendationTableView: UITableView!
    
    var commendationPicture : [UIImage] = [
        UIImage(named: "pp")!,
        UIImage(named: "pp")!,
        UIImage(named: "pp")!,
        UIImage(named: "pp")!
    ]
    var commendationName : [String] = [
        "MVP",
        "Team Leader",
        "Friendy",
        "Team Player"
    ]
    var commendationDescription : [String] = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing sapien, blandit id nisl elementum turpis ipsum.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing sapien, blandit id nisl elementum turpis ipsum.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing sapien, blandit id nisl elementum turpis ipsum.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing sapien, blandit id nisl elementum turpis ipsum."
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commendationTableView.delegate = self
        commendationTableView.dataSource = self
     
    }
    

}

extension CommendationInfoVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commendationName.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commendationCell") as! CommendationTableViewCell
        
        cell.commedationTitle.text = commendationName[indexPath.row]
        cell.commedationTitle.font = UIFont(name: "Hind-Bold", size: 16)
        
        cell.cmdImage.image = commendationPicture[indexPath.row]
        cell.cmdDescription.text = commendationDescription[indexPath.row]
        
        cell.cmdDescription.font = UIFont(name: "Hind-Regular", size: 12)
        
        cell.cellView.layer.cornerRadius = 10
        
        return cell
    }
    
    
    
    
    
}
