//
//  Box.swift
//  MVVM simple example
//
//  Created by Dmitry on 18.07.2021.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func binding(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
