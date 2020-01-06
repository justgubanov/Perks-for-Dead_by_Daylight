//
//  PerkTier.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import Foundation

enum PerkTier {
    
    case tierOne(_ rarity: PerkRarity)
    case tierTwo(_ rarity: PerkRarity)
    case tierThree(_ rarity: PerkRarity)
}
