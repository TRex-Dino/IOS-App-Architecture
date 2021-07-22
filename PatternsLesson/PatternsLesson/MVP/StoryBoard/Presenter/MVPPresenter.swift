//
//  MVPPresenter.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

class MVPPresenter: MVPViewOutput {
    
//    let manager = DataManager() так делать нельзя нарушается принцип Solid(D)
    //сильная связываемость
    weak var view: MVPViewInput!
    var dataManager: DataManagerProtocol!
    
    func didPressedAction() {
        let numbers = dataManager.obtainNumbers()
        view.showNumbers(numbers)
    }
}
