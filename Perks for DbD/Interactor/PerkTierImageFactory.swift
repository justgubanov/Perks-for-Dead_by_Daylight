//
//  PerkTierImageFactory.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 19.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import Foundation
import SwiftUI

class PerkTierImageFactory {
    
    func getImage(for tier: PerkTier?) -> Image {
        let rarityBackground: Image
        
        switch tier {
        case .none:
            rarityBackground = Image.init(uiImage: UIImage())
        case .tierOne:
            rarityBackground = Image("perkTier_one")
        case .tierTwo:
            rarityBackground = Image("perkTier_two")
        case .tierThree:
            rarityBackground = Image("perkTier_three")
        }
        
        return rarityBackground
    }
}
