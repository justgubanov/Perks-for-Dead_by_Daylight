//
//  PerkKeeper.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 01.02.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import UIKit

class PerkKeeper: NSObject {
    
    static func getPerk(withKeyName keyName: PerkKeyName) -> Perk {
        switch keyName {
        case .hope:
            return hope
        case .kindred:
            return kindred
        case .dejaVu:
            return dejaVu
        case .noOneLeftBehind:
            return noOneLeftBehind
        case .lightweight:
            return lightweight
        }
    }
}

extension PerkKeeper {
    
    private static var hope: Perk {
        Perk(keyName: PerkKeyName.hope.rawValue,
             
             name: "Hope",
             type: .survivor,
             category: .basic,
             
             image: UIImage(named: "perkIcon_hope")!,
             description: "",
             
             rarities: PerkTierRarities(onTierOne: .uncommon,
                                        onTierTwo: .rare,
                                        onTierThree: .veryRare))
    }
    private static var kindred: Perk {
        Perk(keyName: PerkKeyName.kindred.rawValue,
             
             name: "Kindred",
             type: .survivor,
             category: .basic,
             
             image: UIImage(named: "perkIcon_kindred")!,
             description: "",
             
             rarities: PerkTierRarities(onTierOne: .uncommon,
                                        onTierTwo: .rare,
                                        onTierThree: .veryRare))
    }
    private static var dejaVu: Perk {
        Perk(keyName: PerkKeyName.dejaVu.rawValue,
             
             name: "Deja Vu",
             type: .survivor,
             category: .basic,
             
             image: UIImage(named: "perkIcon_dejaVu")!,
             description: "",
             
             rarities: PerkTierRarities(onTierOne: .uncommon,
                                        onTierTwo: .rare,
                                        onTierThree: .veryRare))
    }
    private static var noOneLeftBehind: Perk {
        Perk(keyName: PerkKeyName.noOneLeftBehind.rawValue,
             
             name: "No one left behind",
             type: .survivor,
             category: .basic,
             
             image: UIImage(named: "perkIcon_noOneLeftBehind")!,
             description: "",
             
             rarities: PerkTierRarities(onTierOne: .uncommon,
                                        onTierTwo: .rare,
                                        onTierThree: .veryRare))
    }
    private static var lightweight: Perk {
        Perk(keyName: PerkKeyName.lightweight.rawValue,
             
             name: "Lightweight",
             type: .survivor,
             category: .basic,
             
             image: UIImage(named: "perkIcon_lightweight")!,
             description: "",
             
             rarities: PerkTierRarities(onTierOne: .uncommon,
                                        onTierTwo: .uncommon,
                                        onTierThree: .veryRare))
    }
}
