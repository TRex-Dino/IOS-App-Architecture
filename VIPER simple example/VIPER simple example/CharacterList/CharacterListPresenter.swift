//
//  CharacterListPresenter.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

class CharacterListPresenter: CharacterListViewOutputProtocol {
    unowned let view: CharacterListViewInputProtocol
    var interactor: CharacterListInteractorInputProtocol!
    var router: CharacterListRouterInputProtocol!
    
    required init(view: CharacterListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCharacters()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getCharacter(at: indexPath)
    }
}

// MARK: - CourseListInteractorOutputProtocol
extension CharacterListPresenter: CharacterListInteractorOutputProtocol {
    func charactersDidReceive(_ characters: [Character]) {
        let section = CharacterSectionViewModel()
        characters.forEach { section.rows.append(CharacterCellViewModel(character: $0)) }
        view.reloadData(for: section)
    }
    
    func characterDidReceive(_ character: Character) {
        router.openCourseDetailsViewController(with: character)
    }
}
