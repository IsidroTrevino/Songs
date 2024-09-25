//
//  SongList.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI

struct SongList: View {
    @Environment(Modeldata.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredSongs: [Song] {
        modelData.songs.filter {
            song in (!showFavoritesOnly || song.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            List {
                
                Toggle(isOn: $showFavoritesOnly){
                    Text("Only show liked songs")
                }
                
                ForEach(filteredSongs){ song in NavigationLink {
                        SongDetail(song: song)
                } label: {
                    SongRow(song: song)
                }
                }
            }
            .animation(.default, value: filteredSongs)
            .navigationTitle("Songs")
        } detail: {
            Text("Select a song!")
        }
    }
}

#Preview {
    SongList()
        .environment(Modeldata())
}
