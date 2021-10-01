//
//  REMAR_iOS_App.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 11/07/2021.
//

import SwiftUI
import CoreData

@main
struct REMAR_iOS_App: App {
    
    // Set up persistence container
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
