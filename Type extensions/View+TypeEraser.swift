//
//  View+TypeEraser.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 25.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import SwiftUI

extension View {
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
