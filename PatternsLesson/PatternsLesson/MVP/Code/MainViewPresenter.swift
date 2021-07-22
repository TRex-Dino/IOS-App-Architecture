//
//  MainViewPresenter.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

protocol PresenterOutput: AnyObject {
    func didPressedAction()
}
protocol PresenterInput: AnyObject {
    func showNumbers(_ numbers: [Int])
}

class MainViewPresenter: PresenterOutput {
    
//    let manager = DataManager() так делать нельзя нарушается принцип Solid(D)
    //сильная связываемость
    weak var view: PresenterInput!
    var dataManager: DataManagerProtocol!
    
    func didPressedAction() {
        let numbers = dataManager.obtainNumbers()
        view.showNumbers(numbers)
    }
}
