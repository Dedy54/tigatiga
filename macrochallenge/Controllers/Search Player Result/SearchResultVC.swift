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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        
        self.title = "Result"
        
        
        
        let button1 = UIBarButtonItem(image: magnifyingGlass , style: .plain, target: self, action: #selector(tapp))
        self.navigationItem.rightBarButtonItem  = button1
        
//        magnifyingGlass?.withTintColor(UIColor(hex: "#ffce00ff")!)
//        let magIcon = UIBarButtonItem(image: magnifyingGlass, style: .plain, target: self, action: nil)
//        self.navigationController!.navigationItem.rightBarButtonItem  = magIcon
        
        overrideUserInterfaceStyle = .dark
        
        // Do any additional setup after loading the view.
    }
    
    @objc func tapp(){
        print ("abc")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as! ResultTableViewCell
        
        cell.cellView.layer.cornerRadius = 5
        cell.profilePicResult.layer.cornerRadius = cell.profilePicResult.frame.height / 2
        
        cell.resultNameLabel.text = test[indexPath.row]
        cell.resultNameLabel.font = UIFont(name: "Hind-Bold", size: 16)
        cell.profilePicResult.image = UIImage(named: "pp")
        cell.roleResultLabel.text = test[indexPath.row]
        cell.roleResultLabel.font = UIFont(name: "Hind-Regular", size: 16)
        cell.skillRatingResultLabel.font = UIFont(name: "Hind-Regular", size: 16)
        
        return cell
    }

}
