//
//  SongRow.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI

struct SongRow: View {
    var song: Song
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "play")
                    
                    Text(song.name)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Spacer()
                    
                    Text(song.plays)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(width: 100, alignment: .leading)
                    
                    Text(song.songLength)
                        .frame(width: 50, alignment: .trailing)
                }
                .font(.subheadline)
                
                Text(song.band)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            
            if song.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SongRow(song: SampleData.shared.song)
        .modelContainer(SampleData.shared.modelContainer)
}
