//
//  QandAListsApp.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI

@main
struct QandAListsApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
