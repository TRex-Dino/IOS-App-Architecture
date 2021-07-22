//
//  MVPAssembly.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation
import UIKit
//собираем модуль в Assembly

class MVPAssembly: NSObject {

    @IBOutlet weak var viewController: UIViewController!

    //вызывается метод только когда инициализируем объект через сториборд(xib)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? MVPViewController else { return }
        
        let presenter = MVPPresenter()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        presenter.view = view
        presenter.dataManager = dataManager
    }
    
}
