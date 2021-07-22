//
//  MVPViewInput.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation
// protocol отвественный за методы связанные с вызовом внутри View

protocol MVPViewInput: AnyObject {
    
    func showNumbers(_ numbers: [Int])
}
