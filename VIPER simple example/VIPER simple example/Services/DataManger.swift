//
//  DataManger.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    private var characters: [Character] = []
    
    private init() {}
    
    func setFavoriteStatus(for characterName: String, with status: Bool) {
        userDefaults.set(status, forKey: characterName)
    }
    
    func getFavoriteStatus(for characterName: String) -> Bool {
        userDefaults.bool(forKey: characterName)
    }
    
    func setCharacters(_ characters: [Character]) {
        self.characters = characters
    }
    
    func getCharacter(at indexPath: IndexPath) -> Character {
        characters[indexPath.row]
    }
}
