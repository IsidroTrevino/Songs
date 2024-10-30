//
//  GenreHome.swift
//  Songs
//
//  Created by Isidro Treviño on 25/09/24.
//

import SwiftUI
import SwiftData

struct GenreHome: View {
    @Query private var songs: [Song]
    
    var features: [Song] {
        let featuredSongs = songs.filter { $0.isFeatured }
        print("Featured Songs: \(featuredSongs.map { $0.name })")
        return featuredSongs
    }

    
    var categories: [String: [Song]] {
        Dictionary(grouping: songs) { song in
            song.genre
        }
    }

    var body: some View {
        NavigationStack {
            List {
                if let featuredSong = features.first {
                    Group {
                        if let albumImage = loadImage(named: featuredSong.albumImageName) {
                            Image(uiImage: albumImage)
                                .resizable()
                        } else if let preloadedImage = UIImage(named: featuredSong.albumImageName) {
                            Image(uiImage: preloadedImage)
                                .resizable()
                        } else {
                            Image(systemName: "questionmark.app")
                                .resizable()
                                .foregroundColor(.gray)
                        }
                    }
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                }
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    if let genreSongs = categories[key] {
                        GenreRow(genreName: key, items: genreSongs)
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
    
    private func loadImage(named name: String) -> UIImage? {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
        if FileManager.default.fileExists(atPath: documentsURL.path) {
            return UIImage(contentsOfFile: documentsURL.path)
        }
        return nil
    }
}

#Preview {
    GenreHome()
        .modelContainer(SampleData.shared.modelContainer)
}
