//
//  CharacterDetailsInteractor.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

protocol CharacterDetailsInteractorInputProtocol: AnyObject {
    var isFavorite: Bool { get set }
    init(presenter: CharacterDetailsInteractorOutputProtocol, character: Character)
    func provideCharacterDetails()
    func toggleFavoriteStatus()
}

protocol CharacterDetailsInteractorOutputProtocol: AnyObject {
    func receiveCharacterDetails(with characterData: CharacterDetailsData)
    func receiveFavoriteStatus(with status: Bool)
}

class CharacterDetailsInteractor: CharacterDetailsInteractorInputProtocol {
    unowned let presenter: CharacterDetailsInteractorOutputProtocol
    private let character: Character
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: character.name)
        } set {
            DataManager.shared.setFavoriteStatus(for: character.name, with: newValue)
        }
    }
    
    required init(presenter: CharacterDetailsInteractorOutputProtocol, character: Character) {
        self.presenter = presenter
        self.character = character
    }
    
    func provideCharacterDetails() {
        let imageData = ImageManager.shared.fetchImageData(from: character.img)
        let characterDetailsData = CharacterDetailsData(
            characterName: character.name,
            characterNickname: character.nickname,
            characterStatus: character.status,
            imageData: imageData,
            isFavorite: isFavorite
        )
        presenter.receiveCharacterDetails(with: characterDetailsData)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
        presenter.receiveFavoriteStatus(with: isFavorite)
    }
}
