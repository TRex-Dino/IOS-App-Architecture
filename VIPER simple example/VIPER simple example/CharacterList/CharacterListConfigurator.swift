//
//  CharacterListConfigurator.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

protocol CharacterListConfiguratorInputProtocol {
    func configure(with viewController: CharacterListViewController)
}

class CharacterListConfigurator: CharacterListConfiguratorInputProtocol {
    func configure(with viewController: CharacterListViewController) {
        let presenter = CharacterListPresenter(view: viewController)
        let interactor = CharacterListInteractor(presenter: presenter)
        let router = CharacterListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
