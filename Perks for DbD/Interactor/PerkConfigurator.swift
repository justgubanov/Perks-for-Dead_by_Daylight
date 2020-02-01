//
//  PerkConfigurator.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 18.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import Foundation

class PerkConfigurator {
    
    func getNextConfiguration(from currentConfiguration: PerkConfiguration) -> PerkConfiguration {
        var newTier: PerkTier?
        
        let currentTierIndex = currentConfiguration.tier?.rawValue
        
        switch currentTierIndex {
        case 1, 2:
            newTier = PerkTier(rawValue: currentTierIndex! + 1)
        case 3:
            newTier = nil
        case .none:
            newTier = PerkTier(rawValue: 1)
        case .some(_):
            assertionFailure("There is unknowned tier 0_o")
        }
        
        let newCofiguration = PerkConfiguration(perkKeyName: currentConfiguration.perkKeyName,
                                                tier: newTier)
        return newCofiguration
    }
}
