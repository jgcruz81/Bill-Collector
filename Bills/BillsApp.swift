//
//  BillsApp.swift
//  Bills
//
//  Created by Juan Cruz on 3/21/25.
//

import SwiftUI
import SwiftData

@main
struct BillCollectorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Client.self, Job.self])
    }
}

