//
//  PerkGridLane.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 08.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import SwiftUI

struct PerkGridLane: View {
    
    @State var configurations: [PerkConfiguration?]
    let spacerSize: CGFloat
    
    var body: some View {
        HStack(spacing: spacerSize) {
            ForEach(0..<configurations.count, id: \.self) { index in
                self.getPerkCell(for: index)
            }
        }
    }
    
    private func getPerkCell(for index: Int) -> some View {
        if let configuration = configurations[index] {
            return PerkCellView(configuration: configuration)
                .eraseToAnyView()
        } else {
            return Spacer()
                .aspectRatio(1, contentMode: .fit)
                .eraseToAnyView()
        }
    }
}

struct PerkGridLane_Previews: PreviewProvider {
    static var previews: some View {
        
        let hopePerk = Perk(name: "Hope",
                            type: .survivor,
                            category: .basic,
                            
                            image: UIImage(named: "perkIcon_hope")!,
                            description: "",
                            
                            rarities: PerkTierRarities(onTierOne: .uncommon,
                                                       onTierTwo: .rare,
                                                       onTierThree: .veryRare))
        let kindredPerk = Perk(name: "Kindred",
                               type: .survivor,
                               category: .basic,
                               
                               image: UIImage(named: "perkIcon_kindred")!,
                               description: "",
                               
                               rarities: PerkTierRarities(onTierOne: .uncommon,
                                                          onTierTwo: .rare,
                                                          onTierThree: .veryRare))
        let dejaVuPerk = Perk(name: "Deja Vu",
                              type: .survivor,
                              category: .basic,
                              
                              image: UIImage(named: "perkIcon_dejaVu")!,
                              description: "",
                              
                              rarities: PerkTierRarities(onTierOne: .uncommon,
                                                         onTierTwo: .rare,
                                                         onTierThree: .veryRare))
        let noOneLeftBehindPerk = Perk(name: "No one left behind",
                                       type: .survivor,
                                       category: .basic,
                                       
                                       image: UIImage(named: "perkIcon_noOneLeftBehind")!,
                                       description: "",
                                       
                                       rarities: PerkTierRarities(onTierOne: .uncommon,
                                                                  onTierTwo: .rare,
                                                                  onTierThree: .veryRare))
        
        let perkConfigurations = [
            PerkConfiguration(perk: hopePerk, tier: .tierOne),
            PerkConfiguration(perk: kindredPerk, tier: .tierOne),
            PerkConfiguration(perk: noOneLeftBehindPerk, tier: .tierThree),
            PerkConfiguration(perk: dejaVuPerk, tier: .tierTwo),
        ]
        
        return PerkGridLane(configurations: perkConfigurations, spacerSize: 36)
            .frame(width: 414, height: 77)
            .background(Color(.gray))
    }
}
