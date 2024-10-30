//
//  SongList.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI
import SwiftData

struct SongList: View {
    @Query private var allSongs: [Song]
    @Environment(\.modelContext) private var context
    @State private var showAddNewSongSheet = false
    @State private var showFavoritesOnly = false

    var filteredSongs: [Song] {
        showFavoritesOnly ? allSongs.filter { $0.isFavorite } : allSongs
    }

    var body: some View {
        List {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Only show liked songs")
            }
            
            ForEach(filteredSongs) { song in
                NavigationLink(destination: SongDetail(song: song)) {
                    HStack {
                        Text(song.name)
                            .lineLimit(1)
                        Spacer()
                        Text(song.plays)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                            .frame(alignment: .trailing)
                    }
                }
            }
            .onDelete { indexSet in
                deleteSongs(at: indexSet)
            }
        }
        .navigationTitle("Songs")
        .toolbar {
            ToolbarItem {
                Button(action: { showAddNewSongSheet.toggle() }) {
                    Label("Add Song", systemImage: "plus")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        .sheet(isPresented: $showAddNewSongSheet) {
            AddNewSong()
                .environment(\.modelContext, context)
        }
        .animation(.default, value: showFavoritesOnly)
    }

    private func deleteSongs(at offsets: IndexSet) {
        for index in offsets {
            context.delete(filteredSongs[index])
        }
    }
}

#Preview {
    NavigationStack {
        SongList()
            .modelContainer(for: Song.self, inMemory: true)
    }
}
