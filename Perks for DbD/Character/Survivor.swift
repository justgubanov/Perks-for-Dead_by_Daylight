//
//  Survivour.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import UIKit

struct Survivor: Character {

    var name: String
    
    var description: String?
    var image: UIImage?
    
    var ovnedPerks: [CharacterPerk] = []
}
