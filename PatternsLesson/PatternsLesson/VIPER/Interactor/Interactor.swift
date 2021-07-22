//
//  Interactor.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

class Interactor: InteractorInput {
    
    weak var output: InteractorOutput!
    
    var dataManager: DataManagerProtocol!
    func obtainFormattedString() {
        let numbers = dataManager.obtainNumbers()
        let numberString = numbers.map{"\($0)"}.joined(separator: ",")
        
        output.didFinishObtainingFormattedString(numberString)
    }
}
