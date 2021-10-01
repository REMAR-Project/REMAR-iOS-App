//
//  Persistence.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 01/10/2021.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "dataModel")
        
        container.loadPersistentStores{ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved Error \(error)")
            }
            
        }
    }
}
