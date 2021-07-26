//
//  CharacterDetailsConfigurator.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

protocol CharacterDetailsConfiguratorInputProtocol {
    func configure(with view: CharacterDetailsViewController, and character: Character)
}

class CharacterDetailsConfigurator: CharacterDetailsConfiguratorInputProtocol {
    func configure(with view: CharacterDetailsViewController, and character: Character) {
        let presenter = CharacterDetailsPresenter(view: view)
        let interactor = CharacterDetailsInteractor(presenter: presenter, character: character)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
