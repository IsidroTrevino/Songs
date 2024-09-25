//
//  ModelData.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import Foundation

@Observable
class Modeldata {
    var songs: [Song] = load("SongsData.json")
    
    var features: [Song] {
        songs.filter{ $0.isFeatured }
    }
    
    var categories: [String: [Song]] {
        Dictionary(
            grouping: songs,
            by: {$0.genre.rawValue}
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
