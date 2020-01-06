//
//  Character.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 06.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import UIKit

protocol Character {
    
    var name: String { get }
    
    var description: String? { get }
    var image: UIImage? { get }
    
    var ovnedPerks: [CharacterPerk] { get }
}
