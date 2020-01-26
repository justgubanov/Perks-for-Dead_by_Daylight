//
//  PerkBackgroundFactory.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 18.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import Foundation
import SwiftUI

class PerkBackgroundImageFactory {
    
    func getImage(for rarity: PerkRarity?) -> Image {
        let rarityBackground: Image
        
        switch rarity {
        case .none:
            rarityBackground = Image("perkBackground_empty")
        case .uncommon:
            rarityBackground = Image("perkBackground_uncommon")
        case .rare:
            rarityBackground = Image("perkBackground_rare")
        case .veryRare:
            rarityBackground = Image("perkBackground_veryRare")
        case .ultraRare:
            rarityBackground = Image("perkBackground_ultraRare")
        }
        
        return rarityBackground
    }
}
