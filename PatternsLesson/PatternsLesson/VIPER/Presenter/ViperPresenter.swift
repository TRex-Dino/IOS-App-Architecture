//
//  ViperPresenter.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

class Presenter: ViperViewOutput, InteractorOutput {
    
    weak var view: ViperViewInput!
    var interactor: InteractorInput!
    var router: RouterInput!
    
    //MARK: - ViewOutput
    func didPressedAction() {
        interactor.obtainFormattedString()
    }
    
    //MARK: - InteractorOutput
    func didFinishObtainingFormattedString(_ string: String) {
        view.showFormattedString(string)
        router.showOKAlert()
    }
}
