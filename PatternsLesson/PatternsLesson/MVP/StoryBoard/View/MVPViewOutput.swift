//
//  MVPViewOutput.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation
// protocol ответсвенный за связь с Presenter
protocol MVPViewOutput: AnyObject {
    
    func didPressedAction()
}
