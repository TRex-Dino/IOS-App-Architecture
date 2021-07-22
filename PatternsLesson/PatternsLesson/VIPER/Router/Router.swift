//
//  Router.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation
import UIKit
class Router: RouterInput {
    
    weak var view: UIViewController!
    
    
    func showOKAlert() {
        let ac = UIAlertController(title: "Hi", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ac.addAction(ok)
        //здесь показываем экшен, можно сделать переход на другой модуль
        view.present(ac, animated: true)
    }
}
