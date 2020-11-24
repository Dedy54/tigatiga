//
//  ChatDetailViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 17/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class ChatDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(UINib(nibName: "ChatDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatDetailTableViewCell")
        }
    }
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
        self.setKeyBoardWillShow()
        self.hideKeyboardWhenTapped()
        roomChatInteractor = RoomChatInteractor()
        roomChatInteractor?.fetchRoomChat(roomId: roomChat?.id ?? "0", success: { (roomChat) -> (Void) in
            print("")
            self.tableView.reloadData()
        }, failure: { (error) -> (Void) in
            print(error)
        })
    }
    
    @IBAction func sentMessage(_ sender: Any) {
        guard let text = sendTextField.text else { return }
        roomChatInteractor?.createChat(roomId: roomChat?.id ?? "0", text: text, success: { (roomChat) -> (Void) in
            self.roomChat = roomChat
            self.sendTextField.text = ""
        }, failure: { (error) -> (Void) in
            print(error)
        })
    }
    
}

extension ChatDetailViewController {
    
    func setKeyBoardWillShow(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Foundation.Notification) {
        let info = (notification as NSNotification).userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            let contentInsets = UIEdgeInsets(top: 64.0, left: 0.0, bottom: ( keyboardFrame.size.height), right: 0.0);
            self.scrollView.contentInset = contentInsets
        })
    }
    
    @objc func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0);
        self.scrollView.contentInset = contentInsets
    }
}

extension ChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.roomChat?.chatData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.tableView == tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatDetailTableViewCell", for: indexPath) as! ChatDetailTableViewCell
            cell.chatData = self.roomChat?.chatData?[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
