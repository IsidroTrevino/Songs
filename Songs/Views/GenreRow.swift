//
//  GenreRow.swift
//  Songs
//
//  Created by Isidro Treviño on 25/09/24.
//

import SwiftUI

struct GenreRow: View {
    var genreName: String
    var items: [Song]
    
    let gridItems = [GridItem(.fixed(185))]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(genreName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridItems, spacing: 10) {
                    ForEach(items) { song in
                        NavigationLink {
                            SongDetail(song: song)
                        } label: {
                            GenreItem(song: song)
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
            .frame(height: 185)
            .padding(.bottom, 15)
        }
    }
}

#Preview {
    GenreRow(
        genreName: SampleData.shared.song.genre,
        items: Array(Song.sampleData.prefix(5))
    )
    .modelContainer(SampleData.shared.modelContainer)
}
