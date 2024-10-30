//
//  SampleData.swift
//  Songs
//
//  Created by Isidro Treviño on 08/10/24.
//

import Foundation
import SwiftData


@MainActor
class SampleData {
    static let shared = SampleData()


    let modelContainer: ModelContainer


    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var song: Song {
        Song.sampleData.first!
    }

    private init() {
        let schema = Schema([
            Song.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)


        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for song in Song.sampleData {
            context.insert(song)
        }
    }
    
    func randomSong() -> Song {
        Song.sampleData.randomElement() ?? Song.sampleData.first!
    }
}
