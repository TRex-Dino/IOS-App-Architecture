//
//  InteractorOutput.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

protocol InteractorOutput: AnyObject {
    
    func didFinishObtainingFormattedString(_ string: String)
}
