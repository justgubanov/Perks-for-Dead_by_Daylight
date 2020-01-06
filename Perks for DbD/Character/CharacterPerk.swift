//
//  CharacterPerk.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import Foundation

struct CharacterPerk {
    
    private(set) var perk: Perk
    
    private(set) var currentTier: Int = 1
    private(set) var isUnowned: Bool = true
    
    mutating func cycleLevelUp() {
        if currentTier + 1 > perk.tiers.count {
            isUnowned = true
            currentTier = 0
        } else {
            isUnowned = false
            currentTier += 1
        }
    }
}
