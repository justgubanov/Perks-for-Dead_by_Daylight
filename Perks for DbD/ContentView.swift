//
//  ContentView.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 29.09.2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.init(#colorLiteral(red: 0.07230788513, green: 0.1352939747, blue: 0.3149353526, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Perks")
                        .colorScheme(.dark)
                    Spacer()
                }
                PerkGrid(configurations: getDavidConfigurations(), placesInFirstLane: 4)
            }
            .padding(5)
        }
    }
    
    private func getDavidConfigurations() -> [PerkConfiguration] {
        return ConfigurationKeeper().getConfigurations()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
