//
//  Killer.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import UIKit

struct Killer: Character {

    var name: String
    var nickname: String?
    
    var description: String?
    var image: UIImage?
    
    var ability: KillerAbility
    var ovnedPerks: [CharacterPerk] = []
}
