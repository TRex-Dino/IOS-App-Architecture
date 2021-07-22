//
//  ViewModel.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

protocol ViewModelDelegate {
    var text: String { get set }
    
    var textDidChangeHandler: ((String) -> Void)? { get set }
    
    func obtainNumbers()
}

class ViewModel: ViewModelDelegate {
    
    var dataManager: DataManagerProtocol!
    
    var text: String = "" {
        didSet {
            textDidChangeHandler?(text)
        }
    }
    
    var textDidChangeHandler: ((String) -> Void)?
    
    func obtainNumbers() {
        let numbers = dataManager.obtainNumbers()
        
        text = numbers.map{"\($0)"}.joined(separator: ",")
    }
}
