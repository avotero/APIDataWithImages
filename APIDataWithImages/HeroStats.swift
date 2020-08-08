//
//  HeroStats.swift
//  APIDataWithImages
//
//  Created by administrator on 8/4/20.
//  Copyright © 2020 Adrian. All rights reserved.
//

import Foundation

class ItemInfo: Codable {
    let items: [Items]
    
    init(items: [Items]) {
        self.items = items
    }
}

class Items: Codable {
    let name, description, type, icon, icon_large: String
    let id: Int
    let current: Current?
    let members: String?
    
    
    init(name: String, description: String, id: Int, type: String, icon: String, icon_large: String, current: Current?, members: String)  {
        self.name = name
        self.description = description
        self.id = id
        self.type = type
        self.icon = icon
        self.icon_large = icon_large
        self.current = current
        self.members = members
        }
}

class Current: Codable {
    let trend: String
    let price: String? = nil
    
    init(trend:String) {
        self.trend = trend
    }
}

