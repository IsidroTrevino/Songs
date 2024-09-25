//
//  SongDetail.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI

struct SongDetail: View {
    @Environment(Modeldata.self) var modelData
    
    var song: Song
    
    var songIndex: Int {
        modelData.songs.firstIndex(where: {$0.id == song.id})!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            Image(song.bandImageName)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
            CircleImage(image: song.AlbumImageName)
                .offset(y: -120)
                .padding(.bottom, -120)
            VStack(alignment: .leading) {
                
                HStack {
                    Text(song.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.songs[songIndex].isFavorite)
                }
                HStack {
                    Text(song.album)
                    Spacer()
                    Text(song.band)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(song.name)")
                    .font(.title2)
                Text(song.description)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .navigationTitle(song.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = Modeldata()
    SongDetail(song: modelData.songs[0])
        .environment(modelData)
}
