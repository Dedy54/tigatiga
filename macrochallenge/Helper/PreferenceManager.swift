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
    
}
