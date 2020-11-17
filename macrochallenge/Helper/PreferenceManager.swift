//
//  PreferenceManager.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 07/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import Foundation

class PreferenceManager: NSObject {
    
    private static let FinishedOnboarding = "finished_onboarding"
    private static let IsLogin = "is_login"
    private static let UID = "uid"
    
    static let instance = PreferenceManager()
    private let userDefaults: UserDefaults
    
    override init() {
        userDefaults = UserDefaults.standard
    }
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    var finishedOnboarding: Bool {
        get {
            return userDefaults.bool(forKey: PreferenceManager.FinishedOnboarding)
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: PreferenceManager.FinishedOnboarding)
        }
    }
    
    var isLogin: Bool {
        get {
            return userDefaults.bool(forKey: PreferenceManager.IsLogin)
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: PreferenceManager.IsLogin)
        }
    }
    
    var uid: String? {
        get {
            return userDefaults.string(forKey: PreferenceManager.UID)
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: PreferenceManager.UID)
        }
    }
    
}
