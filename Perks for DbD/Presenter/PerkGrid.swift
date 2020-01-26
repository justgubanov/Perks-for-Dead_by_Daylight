//
//  PerkGrid.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 08.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import SwiftUI

struct PerkGrid: View {
    @State var configurations: [PerkConfiguration]
    var placesInFirstLane: Int
    
    private var numberOfRows: Int {
        let sectionCapacity = largeRowCapacity + shortRowCapacity
        let fullSectionRequiredNumber: Int = configurations.count / sectionCapacity
        
        let numberOfExtraPlacesRequired = configurations.count % sectionCapacity
        switch numberOfExtraPlacesRequired {
        case 0:
            return fullSectionRequiredNumber * 2
        case ...largeRowCapacity:
            return fullSectionRequiredNumber * 2 + 1
        default:
            return fullSectionRequiredNumber * 2 + 2
        }
    }
    var largeRowCapacity: Int {
        placesInFirstLane
    }
    var shortRowCapacity: Int {
        placesInFirstLane - 1
    }
    
    private var rowHeight: CGFloat {
        return 70
    }
    private var spacerSize: CGFloat {
        return 40
    }
    
    var body: some View {
        VStack(spacing: 0.1 * -spacerSize) {
            ForEach(0..<numberOfRows) { rowIndex in
                HStack {
                    Spacer()
                    self.getPerkRow(with: rowIndex)
                    Spacer()
                }
            }
            .frame(height: rowHeight)
        }
    }
    
    
    private func getPerkRow(with rowIndex: Int) -> some View {
        let isLargeRow = rowIndex % 2 == 0
                
        let configurationsInRow = getPerkConfigurations(for: rowIndex)
        if isLargeRow {
            return PerkGridLane(configurations: configurationsInRow, spacerSize: spacerSize)
        } else {
            return PerkGridLane(configurations: configurationsInRow, spacerSize: spacerSize)
        }
    }
    
    private func getPerkConfigurations(for rowIndex: Int) -> [PerkConfiguration?] {
        let isLargeRow = rowIndex % 2 == 0
        var configurations: [PerkConfiguration?] = self.configurations
                
        if isLargeRow {
            let fullSectionNumber = rowIndex / 2
            let startIndex = (largeRowCapacity + shortRowCapacity) * fullSectionNumber
            let endIndex = startIndex + largeRowCapacity
            
            let emptyElements = Array<PerkConfiguration?>(repeating: nil, count: largeRowCapacity)
            configurations.append(contentsOf: emptyElements)
            return Array(configurations[startIndex..<endIndex])
        } else {            
            let fullSectionNumber = (rowIndex - 1) / 2
            let startIndex = (largeRowCapacity + shortRowCapacity) * fullSectionNumber + largeRowCapacity
            let endIndex = startIndex + shortRowCapacity
            
            let emptyElements = Array<PerkConfiguration?>(repeating: nil, count: shortRowCapacity)
            configurations.append(contentsOf: emptyElements)
            return Array(configurations[startIndex..<endIndex])
        }
    }
}

struct PerkGrid_Previews: PreviewProvider {
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
        let lightweightPerk = Perk(name: "Lightweight",
                                       type: .survivor,
                                       category: .basic,
                                       
                                       image: UIImage(named: "perkIcon_lightweight")!,
                                       description: "",
                                       
                                       rarities: PerkTierRarities(onTierOne: .uncommon,
                                                                  onTierTwo: .uncommon,
                                                                  onTierThree: .veryRare))
        
        let perkConfigurations = [
            PerkConfiguration(perk: hopePerk, tier: .tierOne),
            PerkConfiguration(perk: kindredPerk, tier: .tierOne),
            PerkConfiguration(perk: noOneLeftBehindPerk, tier: .tierThree),
            PerkConfiguration(perk: dejaVuPerk, tier: .tierTwo),
            
            PerkConfiguration(perk: lightweightPerk, tier: nil),
        ]
        
        return PerkGrid(configurations: perkConfigurations, placesInFirstLane: 4)
            .frame(width: 414, height: 1280)
            .aspectRatio(contentMode: .fill)
            .background(Color(.lightGray))
    }
}
