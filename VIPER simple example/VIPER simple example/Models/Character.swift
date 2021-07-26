//
//  Character.swift
//  VIPER simple example
//
//  Created by Dmitry on 26.07.2021.
//

import Foundation

struct Character: Decodable {
    let name: String
    let img: URL
    let status: String
    let nickname: String
}
