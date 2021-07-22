//
//  DataManager.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

protocol DataManagerProtocol {
    func obtainNumbers() -> [Int]
}

class DataManagerImplementation: DataManagerProtocol {
    func obtainNumbers() -> [Int] {
        return [1,2,3,4,5,6]
    }
}
