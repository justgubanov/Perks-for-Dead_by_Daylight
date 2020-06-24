//
//  Perk.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import UIKit

enum PerkType {
    
    case killer
    case survivor
}

enum PerkCategory: Equatable {
    
    case teachable
    case basic
    
    static func == (lhs: PerkCategory, rhs: PerkCategory) -> Bool {
        switch (lhs, rhs) {
        case (.basic, .basic), (.teachable, .teachable):
            return true
        default:
            return false
        }
    }
}

struct Perk {
    
    var keyName: String
    
    var name: String
    var type: PerkType
    var category: PerkCategory
    
    var image: UIImage
    var description: String
    
    var rarities: PerkTierRarities
}

extension Perk: Hashable {
    
    static func == (lhs: Perk, rhs: Perk) -> Bool {
        return lhs.name.hashValue == rhs.name.hashValue && lhs.type == rhs.type && lhs.category == rhs.category && lhs.rarities == rhs.rarities
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(category)
        hasher.combine(rarities)
    }
}


