//
//  CodeMVPAssembly.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation
import UIKit

class MainModuleAssembly {
    
    class func configuredModule() -> UIViewController {
        let view = MainViewController()
        
        let presenter = MainViewPresenter()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        
        presenter.view = view
        presenter.dataManager = dataManager
        
        return view
    }
}
