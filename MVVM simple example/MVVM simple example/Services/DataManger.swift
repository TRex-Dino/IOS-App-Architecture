//
//  DataManger.swift
//  MVVM simple example
//
//  Created by Dmitry on 17.07.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for characterName: String, with status: Bool) {
        userDefaults.set(status, forKey: characterName)
    }
    
    func getFavoriteStatus(for characterName: String) -> Bool {
        userDefaults.bool(forKey: characterName)
    }
}
