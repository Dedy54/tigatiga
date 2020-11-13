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
    var players: [Player] = []
    
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
    let teamInteractor: TeamInteractor? = TeamInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        defaultGet()
        
        self.title = "Result"
        
        
        
        let button1 = UIBarButtonItem(image: magnifyingGlass , style: .plain, target: self, action: #selector(tapped))
        self.navigationItem.rightBarButtonItem  = button1
        
//        magnifyingGlass?.withTintColor(UIColor(hex: "#ffce00ff")!)
//        let magIcon = UIBarButtonItem(image: magnifyingGlass, style: .plain, target: self, action: nil)
//        self.navigationController!.navigationItem.rightBarButtonItem  = magIcon
        
        overrideUserInterfaceStyle = .dark
        
        // Do any additional setup after loading the view.
    }
    
    func defaultGet() {
        playerInteractor?.fetchPlayers(success: { (playerResults) -> (Void) in
            self.players = playerResults
            self.resultTableView.reloadData()
        }, failure: { (err) -> (Void) in
             print("failed to get default player data with error \(err)")
        })
        teamInteractor?.fetchTeams(success: { (teamResults) -> (Void) in
            self.teams = teamResults
            self.resultTableView.reloadData()
        }, failure: { (err) -> (Void) in
             print("failed to get default team data with error \(err)")
        })
    }
    
    @objc func tapped() {
        performSegue(withIdentifier: "searchPeopleSegue", sender: nil)
    }
    
    @IBAction func unwindToSearchResult(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
//        let searchPeopleController = unwindSegue.source as! searchPeopleVC {
//            self.teams = searchPeopleController.teams
//        }
        resultTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count + teams.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as! ResultTableViewCell
        
        cell.cellView.layer.cornerRadius = 5
        cell.profilePicResult.layer.cornerRadius = cell.profilePicResult.frame.height / 2
        
        if indexPath.row < players.count
        {
            cell.resultNameLabel.text = players[indexPath.row].name
            cell.roleResultLabel.text = players[indexPath.row].experience
            cell.skillRatingResultLabel.text = players[indexPath.row].skillRating
        }
        else
        {
            cell.resultNameLabel.text = teams[indexPath.row - players.count].name
            cell.roleResultLabel.text = teams[indexPath.row - players.count].description
            cell.skillRatingResultLabel.text = teams[indexPath.row - players.count].skillRating
        }
        cell.resultNameLabel.font = UIFont(name: "Hind-Bold", size: 16)
        cell.profilePicResult.image = UIImage(named: "pp")
        cell.roleResultLabel.font = UIFont(name: "Hind-Regular", size: 16)
        cell.skillRatingResultLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        return cell
    }

}
