//
//  TEMPLATEApp.swift
//  Shared
//
//  Created by Bruno Wide on 06/03/22.
//

import SwiftUI
import Swinject

@main
struct TEMPLATEApp: App {
    
    static let container: Container = ContainerFactory.build()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
