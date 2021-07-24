//
//  AssamblyModelBuilder.swift
//  MVP IOS Dev
//
//  Created by Dmitry on 22.07.2021.
//

//сборка модулей

import UIKit

protocol AssamblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssamblyModelBuilder: AssamblyBuilderProtocol {
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        
        view.presenter = presenter
        return view
    }
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        view.presenter = presenter
        return view
    }
}
