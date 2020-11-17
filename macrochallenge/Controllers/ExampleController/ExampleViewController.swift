//
//  ExampleViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 07/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "ChatCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChatCollectionViewCell")
            collectionView.delaysContentTouches = false
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.alwaysBounceVertical = true
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.minimumLineSpacing = 20
                layout.minimumInteritemSpacing = 0
                layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
            }
        }
    }
    
    var roomChatInteractor: RoomChatInteractor?
    
    static func instantiateViewController() -> ChatViewController {
        let controller = ChatViewController(nibName: "ChatViewController", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat"
        self.roomChatInteractor = RoomChatInteractor()
        self.roomChatInteractor?.fetchRoomChatCurrentUser(success: { (rooms) -> (Void) in
            self.collectionView.reloadData()
        }, failure: { (error) -> (Void) in })
    }
}

extension ExampleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCollectionViewCell", for: indexPath) as! ChatCollectionViewCell
        cell.chatRoom = self.roomChatInteractor?.roomChats[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.roomChatInteractor?.roomChats.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ExampleViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.widthScreen - 40, height: 80)
    }
    
}
