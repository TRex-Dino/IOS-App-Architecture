//
//  CharacterListInteractor.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

protocol CharacterListInteractorInputProtocol: AnyObject {
    init(presenter: CharacterListInteractorOutputProtocol)
    func fetchCharacters()
    func getCharacter(at indexPath: IndexPath)
}

protocol CharacterListInteractorOutputProtocol: AnyObject {
    func charactersDidReceive(_ characters: [Character])
    func characterDidReceive(_ character: Character)
}

class CharacterListInteractor: CharacterListInteractorInputProtocol {
    unowned let presenter: CharacterListInteractorOutputProtocol
    
    required init(presenter: CharacterListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCharacters() {
        NetworkManager.shared.fetchData { characters in
            self.presenter.charactersDidReceive(characters)
            DataManager.shared.setCharacters(characters)
        }
    }
    
    func getCharacter(at indexPath: IndexPath) {
        let character = DataManager.shared.getCharacter(at: indexPath)
        presenter.characterDidReceive(character)
    }
}
