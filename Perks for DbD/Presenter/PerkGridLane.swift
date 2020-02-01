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
        let perkConfigurations = [
            PerkConfiguration(perkKeyName: PerkKeyName.hope.rawValue, tier: .tierOne),
            PerkConfiguration(perkKeyName: PerkKeyName.kindred.rawValue, tier: .tierOne),
            PerkConfiguration(perkKeyName: PerkKeyName.noOneLeftBehind.rawValue, tier: .tierThree),
            PerkConfiguration(perkKeyName: PerkKeyName.dejaVu.rawValue, tier: .tierTwo),
        ]
        
        return PerkGridLane(configurations: perkConfigurations, spacerSize: 36)
            .frame(width: 414, height: 77)
            .background(Color(.gray))
    }
}
