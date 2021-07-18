//
//  CharacterDetailsViewModel.swift
//  MVVM simple example
//
//  Created by Dmitry on 17.07.2021.
//

import Foundation

protocol CharacterDetailsViewModelProtocol: AnyObject {
    var name: String { get }
    var nickname: String { get }
    var status: String { get }
    var imageData: Data? { get }
    
    var isFavorite: Box<Bool> { get }
    var viewModelDidChange: ((CharacterDetailsViewModelProtocol) -> Void)? { get set }
    
    init(char: Character)
    
    func favoriteButtonPressed()
}

class CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {
    var name: String {
        char.name
    }
    
    var nickname: String {
        "Nickname: \(char.nickname)"
    }
    
    var status: String {
        "Status: \(char.status)"
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: char.img)
    }
    
    var viewModelDidChange: ((CharacterDetailsViewModelProtocol) -> Void)?
    
    //Second exmple to use only one element to get value
    var isFavorite: Box<Bool>
    
  //First example to use all class(self)
//    var isFavorite: Bool {
//        get {
//            DataManager.shared.getFavoriteStatus(for: char.name)
//        } set {
//            DataManager.shared.setFavoriteStatus(for: char.name, with: newValue)
//            viewModelDidChange?(self)
//        }
//    }
    
    private let char: Character
    
    required init(char: Character) {
        self.char = char
        isFavorite = Box(value: DataManager.shared.getFavoriteStatus(for: char.name))
    }
    
    func favoriteButtonPressed() {
        isFavorite.value.toggle()
        DataManager.shared.setFavoriteStatus(for: char.name, with: isFavorite.value)
    }
}
