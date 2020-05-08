//
//  Model.swift
//  SkackOverFolow
//
//  Created by Dương chãng on 5/7/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import Foundation
struct ResuthObject: Codable {
    var items: [Item]
    var has_more: Bool
    var quota_max: Int
    var quota_remaining: Int
}
struct Item: Codable {
    var tags = [String]()
    var owner: Owner
    var is_answered: Bool
    var view_count: Int
    var answer_count: Int
    var score: Int
    var link: String
    var title: String
    
}

struct Owner: Codable{
    var user_id: Int
    
    enum Codingkeys: String, CodingKey {
        case user_id = "user_id"
    }
}
