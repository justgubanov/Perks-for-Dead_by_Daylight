//
//  Perk.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import Foundation

struct Perk {
    
    var type: PerkType
    var tiers: [PerkTier]
    
    var isForSurvivor: Bool{
        didSet {
            isForKiller = !isForSurvivour
        }
    }
    var isForKiller: Bool {
        didSet {
            isForSurvivour = !isForKiller
        }
    }
}
