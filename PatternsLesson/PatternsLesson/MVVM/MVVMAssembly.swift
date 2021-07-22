//
//  MVVMAssembly.swift
//  PatternsLesson
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation
import UIKit
//собираем модуль в Assembly

class MVVMAssembly: NSObject {

    @IBOutlet weak var viewController: UIViewController!

    //вызывается метод только когда инициализируем объект через сториборд(xib)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? MVVMViewController else { return }
        
        let viewModel = ViewModel()
        let dataManager = DataManagerImplementation()
        
        view.viewModel = viewModel
        viewModel.dataManager = dataManager
    }
    
}
