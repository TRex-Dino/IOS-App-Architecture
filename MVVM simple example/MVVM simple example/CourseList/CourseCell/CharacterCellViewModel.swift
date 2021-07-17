//
//  CharacterCellViewModel.swift
//  MVVM simple example
//
//  Created by Dmitry on 17.07.2021.
//

import Foundation

protocol CharacterCellViewModelProtocol {
    var characterName: String { get }
    var imageData: Data? { get }
    init(char: Character)
}

class CharacterCellViewModel: CharacterCellViewModelProtocol {
    var characterName: String {
        char.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: char.img)
    }
    
    private let char: Character
    
    required init(char: Character) {
        self.char = char
    }
}
