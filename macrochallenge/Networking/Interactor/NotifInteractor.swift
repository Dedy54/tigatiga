//
//  NotifInteractor.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 02/11/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation
import Firebase

protocol NotifInteractorDelegate {
    func fetchNotifs(success: @escaping ([Notif]) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchNotif(id: String, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void))
    func fetchNotifCurrentUser(success: @escaping ([Notif]) -> (Void), failure: @escaping (Error) -> (Void))
    func createNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void))
    func updateNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void))
}

class NotifInteractor: BaseInteractor, NotifInteractorDelegate {
    var notifs: [Notif] = []
    var notif: Notif = Notif()
    
    func fetchNotifs(success: @escaping ([Notif]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchNotifs(success: { (notifs) -> (Void) in
            self.notifs = notifs
            success(notifs)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchNotif(id: String, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchNotif(id: id, success: { (notif) -> (Void) in
            self.notif = notif
            success(notif)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func fetchNotifCurrentUser(success: @escaping ([Notif]) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.fetchNotifCurrentUser(success: { (notifs) -> (Void) in
            self.notifs = notifs
            success(notifs)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func createNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.createNotif(notif: notif, success: { (notif) -> (Void) in
            self.notif = notif
            success(notif)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
    
    func updateNotif(notif: Notif, success: @escaping (Notif) -> (Void), failure: @escaping (Error) -> (Void)) {
        service.updateNotif(notif: notif, success: { (notif) -> (Void) in
            self.notif = notif
            success(notif)
        }) { (error) -> (Void) in
            failure(error)
        }
    }
}
