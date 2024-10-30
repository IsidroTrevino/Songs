//
//  SongsApp.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI
import SwiftData

@main
struct SongsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Song.self])
        }
    }
}
