//
//  HeroStats.swift
//  APIDataWithImages
//
//  Created by administrator on 8/4/20.
//  Copyright © 2020 Adrian. All rights reserved.
//

import Foundation

/*struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}*/

class Items: Codable {
    let items: [ItemInfo]
    
    init(items: [ItemInfo]) {
        self.items = items
    }
}

class ItemInfo: Codable {
    let name, description, type, icon: String
    let id: Int
    
    init(name: String, description: String, id: Int, type: String, icon: String)  {
        self.name = name
        self.description = description
        self.id = id
        self.type = type
        self.icon = icon
        
    }
}

