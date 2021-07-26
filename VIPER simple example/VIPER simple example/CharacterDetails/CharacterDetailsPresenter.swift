//
//  CharacterDetailsPresenter.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

struct CharacterDetailsData {
    let characterName: String
    let characterNickname: String
    let characterStatus: String
    let imageData: Data?
    let isFavorite: Bool
}

class CharacterDetailsPresenter: CharacterDetailsViewOutputProtocol {
    unowned let view: CharacterDetailsViewInputProtocol
    var interactor: CharacterDetailsInteractorInputProtocol!
    
    required init(view: CharacterDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCharacterDetails()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavoriteStatus()
    }
}

// MARK: - CourseDetailsInteractorOutputProtocol
extension CharacterDetailsPresenter: CharacterDetailsInteractorOutputProtocol {
    func receiveCharacterDetails(with characterData: CharacterDetailsData) {
        let characterNickName = "Nickname: \(characterData.characterNickname)"
        let characterStatus = "Status: \(characterData.characterStatus)"
        
        view.displayCharacterName(with: characterData.characterName)
        view.displayCharacterNickname(with: characterNickName)
        view.displayCharacterStatus(with: characterStatus)
        
        view.displayImageForFavoriteButton(with: characterData.isFavorite)
        
        guard let imageData = characterData.imageData else { return }
        view.displayImage(with: imageData)
    }
    
    func receiveFavoriteStatus(with status: Bool) {
        view.displayImageForFavoriteButton(with: status)
    }
}
