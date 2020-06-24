//
//  ConfigurationKeeper.swift
//  Perks for DbD
//
//  Created by Александр Губанов on 02.02.2020.
//  Copyright © 2020 Plekhanov University. All rights reserved.
//

import CoreData
import UIKit

class ConfigurationKeeper {
    
    private var configurationEntityName = "PerkConfigurationEntity"
    
    private var perkTierDataKey = "tierRawValue"
    private var perkDataKey = "perkKeyName"
    private var characterDataKey = "characterKeyName"
    
    func getConfigurations(/*forCharacter keyName: CharacterKeyName*/) -> [PerkConfiguration] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: configurationEntityName)
        fetchRequest.predicate = NSPredicate(format: "\(characterDataKey) = %@", "david")
        
        guard let result = try? managedContext.fetch(fetchRequest),
            let records = result as? [PerkConfigurationEntity] else {
                return []
        }
        
        var configurations = [PerkConfiguration]()
        for data in records {
            if let perkTierRawValue = data.value(forKey: perkTierDataKey) as? Int,
                let perkKeyName = data.value(forKey: perkDataKey) as? String,
                let characterKeyName = data.value(forKey: characterDataKey) as? String {
                
                let perkTier = PerkTier(rawValue: perkTierRawValue)
                let configurationRecord = PerkConfiguration(perkKeyName: perkKeyName,
                                                            characterKeyName: characterKeyName,
                                                            tier: perkTier)
                configurations.append(configurationRecord)
            }
        }
        
        return configurations
    }
    
    func updateDataRecord(_ currentConfiguration: PerkConfiguration, _ newConfiguration: PerkConfiguration) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let characterKeyName = currentConfiguration.characterKeyName
        let perkKeyName = currentConfiguration.perkKeyName
        let newTier = newConfiguration.tier?.rawValue ?? 0
        
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: configurationEntityName)
            request.predicate = NSPredicate(format: "\(characterDataKey) = %@ AND \(perkDataKey) = %@", characterKeyName, perkKeyName)
            
            if let test = try? managedContext.fetch(request),
                let objectToUpdate = test.first as? NSManagedObject {
                
                let newTier = newConfiguration.tier?.rawValue ?? 0
                objectToUpdate.setValue(newTier, forKey: perkTierDataKey)
                print("Updating...")
            } else if let configurationEntity = NSEntityDescription.entity(forEntityName: configurationEntityName, in: managedContext) {
                
                let configuration = NSManagedObject(entity: configurationEntity, insertInto: managedContext)
                configuration.setValue(newTier, forKey: perkTierDataKey)
                configuration.setValue(perkKeyName, forKey: perkDataKey)
                configuration.setValue(characterKeyName, forKey: characterDataKey)
                print("Creating...")
            }
            
            try managedContext.save()
            print("Saved...")
        } catch {
            print(error)
        }
    }
}
