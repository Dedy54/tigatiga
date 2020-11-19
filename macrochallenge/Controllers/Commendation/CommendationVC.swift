//
//  CommendationVC.swift
//  macrochallenge
//
//  Created by Glendito Jeremiah Palendeng on 12/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class CommendationVC: UIViewController {
    
    enum commendations : Int{
        case mvp
        case teamleader
        case friendly
        case teamplayer
    }
    var mabarYellowTranspararent = UIColor(hex: "#ffce0032")
    
    @IBOutlet var starButton: [UIButton]!
    @IBOutlet var commendationButton: [UIButton]!
    
    @IBOutlet weak var commendationTitle: UILabel!
    @IBOutlet weak var howExpTitle: UILabel!
    @IBOutlet weak var doYouTitle: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    let playerInteractor: PlayerInteractor? = PlayerInteractor()
     var selectedPeople: Player?
    
    var onClose: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButton.layer.cornerRadius = 20
        
        self.view.layer.cornerRadius = 20
        
        setFont()
        
    }
    
    func setFont(){
        commendationTitle.font = UIFont(name: "Hind-Bold", size: 16)
        howExpTitle.font = UIFont(name: "Hind-Regular", size: 16)
        doYouTitle.font = UIFont(name: "Hind-Regular", size: 16)
        infoButton.titleLabel?.font = UIFont(name: "Hind-Regular", size: 16)
        sendButton.titleLabel?.font = UIFont(name: "Hind-Bold", size: 16)
    }
    
    
    @IBAction func infoTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CommendationInfo", bundle: nil)
        
        let commendationInfo = storyboard.instantiateViewController(withIdentifier: "CommendationInfo") as! CommendationInfoVC
        
        present(commendationInfo, animated: true, completion: nil)
        
    }
    
    @IBAction func sendTapped(_ sender: Any) {
        let commendationType : commendations = getCommendationType()
        let commendationTemp = Commendation(id: "\(commendationType)")
        if selectedPeople?.commendations == nil {
            selectedPeople?.commendations = []
        }
        selectedPeople?.commendations?.append(commendationTemp)
        playerInteractor?.updatePlayer(player: selectedPeople!, success: { (playerUpdated) -> (Void) in
            print("success to update player with data \(playerUpdated)")
            print(commendationType)
            self.onClose!()
        }, failure: { (err) -> (Void) in
            print("failed to update player data with error \(err)")
            self.onClose!()
        })
    }
    
    func getCommendationType() -> commendations{
        for (index, button) in commendationButton.enumerated(){
            if button.backgroundColor == mabarYellowTranspararent{
                return commendations(rawValue: index) ?? .mvp
            }
        }
        return .mvp
    }
    
    @IBAction func commedationButtonTapped(_ sender: UIButton) {
        commendationButton.forEach({
            $0.backgroundColor = nil
        })
        sender.backgroundColor = mabarYellowTranspararent
    }
    
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        for button in starButton{
            if button.tag <= sender.tag {
                button.setImage(UIImage(named: "Star"), for: .normal)
            }else{
                button.setImage(UIImage(named: "StarTransparent"), for: .normal)
            }
        }
    }
    
    
    
    

}
