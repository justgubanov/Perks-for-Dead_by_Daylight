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
        return 60
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
        let perkConfigurations = [
            PerkConfiguration(perkKeyName: PerkKeyName.hope.rawValue, tier: .tierOne),
            PerkConfiguration(perkKeyName: PerkKeyName.kindred.rawValue, tier: .tierOne),
            PerkConfiguration(perkKeyName: PerkKeyName.noOneLeftBehind.rawValue, tier: .tierThree),
            PerkConfiguration(perkKeyName: PerkKeyName.dejaVu.rawValue, tier: .tierTwo),
            
            PerkConfiguration(perkKeyName: PerkKeyName.lightweight.rawValue, tier: nil),
        ]
        
        return PerkGrid(configurations: perkConfigurations, placesInFirstLane: 4)
            .frame(width: 414, height: 1280)
            .aspectRatio(contentMode: .fill)
            .background(Color(.lightGray))
    }
}
