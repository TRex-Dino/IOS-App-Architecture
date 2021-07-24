//
//  Comment.swift
//  MVP IOS Dev
//
//  Created by Dmitry on 22.07.2021.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
}
