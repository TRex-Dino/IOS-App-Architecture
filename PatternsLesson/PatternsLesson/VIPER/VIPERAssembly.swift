//
//  VIPERAssembly.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation
import UIKit
//собираем модуль в Assembly

class VIPERAssembly: NSObject {

    @IBOutlet weak var viewController: UIViewController!

    //вызывается метод только когда инициализируем объект через сториборд(xib)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? ViperViewController else { return }
        
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.dataManager = dataManager
        interactor.output = presenter
        
        router.view = view
    }
    
}
