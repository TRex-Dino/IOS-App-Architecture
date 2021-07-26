//
//  CharacterListRouter.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

protocol CharacterListRouterInputProtocol {
    init(viewController: CharacterListViewController)
    func openCourseDetailsViewController(with character: Character)
}

class CharacterListRouter: CharacterListRouterInputProtocol {
    unowned let viewController: CharacterListViewController
    
    required init(viewController: CharacterListViewController) {
        self.viewController = viewController
    }
    
    func openCourseDetailsViewController(with character: Character) {
        viewController.performSegue(withIdentifier: "ShowDetails", sender: character)
    }
}
