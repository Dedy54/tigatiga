//
//  ChatDetailViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 17/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class ChatDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var roomChatInteractor: RoomChatInteractor?
    var roomChat: RoomChat?
    
    static func instantiateViewController() -> ChatDetailViewController {
        let controller = ChatDetailViewController(nibName: "ChatDetailViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomChatInteractor = RoomChatInteractor()
        roomChatInteractor?.fetchRoomChat(roomId: roomChat?.id ?? "0", success: { (roomChat) -> (Void) in
            print("")
        }, failure: { (error) -> (Void) in
            print(error)
        })
    }
}
