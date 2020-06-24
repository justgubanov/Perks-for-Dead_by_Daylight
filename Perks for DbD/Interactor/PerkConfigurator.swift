//
//  PerkConfigurator.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 18.01.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import CoreData
import UIKit

class PerkConfigurator {
    
    func getNextConfiguration(from currentConfiguration: PerkConfiguration) -> PerkConfiguration {
        var newTier: PerkTier?

        switch currentConfiguration.tier {
        case .none:
            newTier = .tierOne
        case .tierOne:
            newTier = .tierTwo
        case .tierTwo:
            newTier = .tierThree
        case .tierThree:
            newTier = nil
        }
        
        let newCofiguration = PerkConfiguration(perkKeyName: currentConfiguration.perkKeyName,
                                                tier: newTier)
        updateDataRecord(currentConfiguration, newCofiguration)
        
        return newCofiguration
    }
    
    private func updateDataRecord(_ currentConfiguration: PerkConfiguration, _ newConfiguration: PerkConfiguration) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let characterKeyName = currentConfiguration.characterKeyName
        let perkKeyName = currentConfiguration.perkKeyName
        let newTier = newConfiguration.tier?.rawValue ?? 0
        
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PerkConfigurationEntity")
            request.predicate = NSPredicate(format: "characterKeyName = %@ AND perkKeyName = %@", characterKeyName, perkKeyName)
            
            if let test = try? managedContext.fetch(request),
                let objectToUpdate = test.first as? NSManagedObject {
                
                let newTier = newConfiguration.tier?.rawValue ?? 0
                objectToUpdate.setValue(newTier, forKey: "tierRawValue")
                print("Updating...")
            } else if let configurationEntity = NSEntityDescription.entity(forEntityName: "PerkConfigurationEntity", in: managedContext) {
                
                let configuration = NSManagedObject(entity: configurationEntity, insertInto: managedContext)
                configuration.setValue(newTier, forKey: "tierRawValue")
                configuration.setValue(perkKeyName, forKey: "perkKeyName")
                configuration.setValue(characterKeyName, forKey: "characterKeyName")
                print("Creating...")
            }
            
            try managedContext.save()
            print("Saved...")
        } catch {
            print(error)
        }
    }
}
