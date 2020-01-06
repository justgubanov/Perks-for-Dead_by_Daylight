//
//  Perk.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import UIKit

struct Perk {
    
    var name: String
    
    var image: UIImage
    var description: String?
    
    var type: PerkType
    var tiers: [PerkTier]
    
    var isForSurvivor: Bool{
        didSet {
            isForKiller = !isForSurvivor
        }
    }
    var isForKiller: Bool {
        didSet {
            isForSurvivor = !isForKiller
        }
    }
}
