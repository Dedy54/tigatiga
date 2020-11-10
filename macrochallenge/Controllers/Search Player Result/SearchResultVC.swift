//
//  SearchResultVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let test = ["abc","asd","asda","asd","asd"]
    let magnifyingGlass = UIImage(systemName: "magnifyingglass")
    
    @IBOutlet weak var resultTableView: UITableView!
    
    var teams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        
        self.title = "Result"
        
        magnifyingGlass?.withTintColor(UIColor(hex: "#ffce00ff")!)
//        let magIcon = UIBarButtonItem(image: magnifyingGlass, style: .plain, target: self, action: nil)
//        self.navigationController!.navigationItem.rightBarButtonItem  = magIcon
        let button1 = UIBarButtonItem(image: magnifyingGlass , style: .plain, target: self, action: #selector(tapped))
        self.navigationItem.rightBarButtonItem  = button1
        
        overrideUserInterfaceStyle = .dark
        
        // Do any additional setup after loading the view.
    }
    
    @objc func tapped() {
        performSegue(withIdentifier: "searchPeopleSegue", sender: nil)
    }
    
    @IBAction func unwindToSearchResult(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        resultTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as! ResultTableViewCell
        
        cell.cellView.layer.cornerRadius = 5
        cell.profilePicResult.layer.cornerRadius = cell.profilePicResult.frame.height / 2
        
        cell.resultNameLabel.text = teams[indexPath.row].name
        cell.resultNameLabel.font = UIFont(name: "Hind-Bold", size: 16)
        cell.profilePicResult.image = UIImage(named: "pp")
        cell.roleResultLabel.text = String(teams[indexPath.row].description!)
        cell.roleResultLabel.font = UIFont(name: "Hind-Regular", size: 16)
        cell.skillRatingResultLabel.text = String(teams[indexPath.row].skillRating!)
        cell.skillRatingResultLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        return cell
    }

}
