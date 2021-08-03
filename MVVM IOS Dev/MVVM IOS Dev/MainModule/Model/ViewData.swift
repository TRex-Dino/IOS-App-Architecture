//
//  ViewData.swift
//  MVVM IOS Dev
//
//  Created by Dmitry on 03.08.2021.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
