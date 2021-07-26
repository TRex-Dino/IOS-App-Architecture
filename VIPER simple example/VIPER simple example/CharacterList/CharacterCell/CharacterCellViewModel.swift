//
//  CharacterCellViewModel.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

protocol SectionRowRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class CharacterCellViewModel: CellIdentifiable {
    let characterName: String
    let imageURL: URL
    
    var cellIdentifier: String {
        "cell"
    }
    
    var cellHeight: Double {
        100
    }
    
    init(character: Character) {
        characterName = character.name
        imageURL = character.img
    }
}

class CharacterSectionViewModel: SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
}
