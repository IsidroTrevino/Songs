//
//  SongsTests.swift
//  SongsTests
//
//  Created by Isidro Treviño on 30/10/24.
//

import Testing
@testable import Songs

@MainActor
struct SongsTests {

    @Test func testRandomSong() throws {
        let sampleData = SampleData.shared
        let sampleSongs = Song.sampleData

        for _ in 1...10 {
            let randomSong = sampleData.randomSong()
            
            print("Cancion random: \(randomSong.name)")
            print("Viendo si existe en: ")

            sampleSongs.forEach { sampleSong in
                print("  - Cancion: \(sampleSong.name)")
            }

            #expect(sampleSongs.contains(where: {
                $0.name == randomSong.name && $0.album == randomSong.album
            }))
        }
    }
}
