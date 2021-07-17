//
//  CharacterListViewModel.swift
//  MVVM simple example
//
//  Created by Dmitry on 17.07.2021.
//

import Foundation

protocol CharacterListViewModelProtocol: AnyObject {
    var characters: [Character] { get }
    func fetchCharacters(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CharacterCellViewModelProtocol
    func detailsViewModel(at indexPath: IndexPath) -> CharacterDetailsViewModelProtocol
}

class CharacterListViewModel: CharacterListViewModelProtocol {
    var characters: [Character] = []
    
    func fetchCharacters(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { characters in
            self.characters = characters
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        characters.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CharacterCellViewModelProtocol {
        let char = characters[indexPath.row]
        return CharacterCellViewModel(char: char)
    }
    
    func detailsViewModel(at indexPath: IndexPath) -> CharacterDetailsViewModelProtocol {
        let char = characters[indexPath.row]
        return CharacterDetailsViewModel(char: char)
    }
}
