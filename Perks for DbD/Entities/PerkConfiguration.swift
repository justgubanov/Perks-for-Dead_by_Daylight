//
//  PerkConfiguration.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import Foundation

enum PerkTier: Int {
    
    case tierOne = 1
    case tierTwo
    case tierThree
}

struct PerkConfiguration {
    
    private(set) var perkKeyName: String
    private(set) var characterKeyName = "David"

    private(set) var tier: PerkTier?
    
    var perk: Perk {
        guard let keyName = PerkKeyName(rawValue: perkKeyName) else {
            return PerkKeeper.getPerk(withKeyName: .hope)
        }
        return PerkKeeper.getPerk(withKeyName: keyName)
    }
    var isOwned: Bool {
        return tier != nil
    }
    var rarity: PerkRarity? {
        switch self.tier {
        case .tierOne:
            return perk.rarities.onTierOne
        case .tierTwo:
            return perk.rarities.onTierTwo
        case .tierThree:
            return perk.rarities.onTierThree
        case .none:
            return nil
        }
    }
}

extension PerkConfiguration: Hashable {
    
    static func == (lhs: PerkConfiguration, rhs: PerkConfiguration) -> Bool {
        return lhs.perk == lhs.perk && lhs.tier == rhs.tier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(perk)
        hasher.combine(tier)
    }
}
