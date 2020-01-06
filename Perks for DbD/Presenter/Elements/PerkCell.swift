//
//  PerkCell.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import SwiftUI

struct PerkCell: View {
    
    @State var characterPerk: CharacterPerk
    
    var body: some View {
        getRarityImage()
            .overlay(
                Image(uiImage: characterPerk.perk.image)
        )
            .opacity(characterPerk.isUnowned ? 0.8 : 1)
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        self.characterPerk.cycleLevelUp()
                }
        )
    }
    
    func getRarityImage() -> Image {
        if characterPerk.isUnowned {
            return Image("Perk Template")
        } else {
            let currentTier = characterPerk.currentTier - 1
            let tier = characterPerk.perk.tiers[currentTier]
            
            switch tier.rarity {
            case .uncommon:
                return Image("Perk Template Uncommon")
            case .rare:
                return Image("Perk Template Rare")
            case .veryRare:
                return Image("Perk Template Very Rare")
            case .ultraRare:
                return Image("Perk Template Ultra Rare")
            }
        }
    }
}

struct PerkCell_Previews: PreviewProvider {
    static var previews: some View {
        let perkToPresent = Perk(name: "Hope",
                                 image: UIImage(named: "Hope")!,
                                 description: nil,
                                 type: .basic,
                                 tiers: [.tierOne(.uncommon),
                                         .tierTwo(.rare),
                                         .tierThree(.veryRare)],
                                 isForSurvivor: true,
                                 isForKiller: false)
        
        let characterPerk = CharacterPerk(perk: perkToPresent,
                                          currentTier: 1,
                                          isUnowned: false)
        
        return PerkCell(characterPerk: characterPerk)
    }
}
