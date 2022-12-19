//
//  LibraryProjectApp.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//

import SwiftUI

@main
struct LibraryProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            AdminView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
