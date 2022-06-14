//
//  CleannyApp.swift
//  Cleanny
//
//  Created by 종건 on 2022/06/08.
//

import SwiftUI

@main
struct CleannyApp: App {
    @StateObject var cleaning =  CleaningDataStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cleaning)
//                .environmentObject(CloudkitUserViewModel())
               // .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
