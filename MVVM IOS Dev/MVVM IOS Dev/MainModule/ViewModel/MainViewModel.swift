//
//  MainViewModel.swift
//  MVVM IOS Dev
//
//  Created by Dmitry on 03.08.2021.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)? {get set}
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> Void)?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        // Start loading
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil,
                                               numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "checkmark.circle",
                                                         title: "Success",
                                                         description: "Good",
                                                         numberPhone: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "xmark.octagon",
                                                         title: "Failure",
                                                         description: "Not user",
                                                         numberPhone: nil)))
        }
        
    }
}
