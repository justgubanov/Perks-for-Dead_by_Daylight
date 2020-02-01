//
//  PerkCell.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import SwiftUI

struct PerkCellView: View {
    
    @State var configuration: PerkConfiguration
    
    private let configurator = PerkConfigurator()
    private let backgroundImageFactory = PerkBackgroundImageFactory()
    private let tierImageFactory = PerkTierImageFactory()
    
    var body: some View {
        ZStack {
            backgroundImageFactory.getImage(for: configuration.rarity)
                .resizable()
                .opacity(!configuration.isOwned ? 0.8 : 1.0)
            Image(uiImage: configuration.perk.image)
                .resizable()
            tierImageFactory.getImage(for: configuration.tier)
                .resizable()
        }
        .gesture(
            TapGesture()
                .onEnded { _ in
                    self.configuration = self.configurator.getNextConfiguration(from: self.configuration)
            }
        )
        .aspectRatio(1, contentMode: .fit)
    }
}

struct PerkCell_Previews: PreviewProvider {
    static var previews: some View {
        let hopeTierThree = PerkConfiguration(perkKeyName: PerkKeyName.hope.rawValue,
                                              tier: .tierThree)
        
        return PerkCellView(configuration: hopeTierThree)
            .frame(width: 500, height: 250)
            .background(Color(.gray))
    }
}
