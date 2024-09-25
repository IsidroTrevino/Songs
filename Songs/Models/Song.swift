//
//  Song.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import Foundation

struct Song: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var album: String
    var genre: Genre
    enum Genre: String, CaseIterable, Codable {
        case HipHop = "Hip-Hop"
        case Grunge = "Grunge"
        case Pop = "Pop"
        case AltRock = "Alternative rock"
    }
    var isFeatured: Bool
    var plays: String
    var isFavorite: Bool
    var songLength: String
    var band: String
    var description: String
    var bandImageName: String
    var AlbumImageName: String
}
