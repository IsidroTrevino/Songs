//
//  GenreItem.swift
//  Songs
//
//  Created by Isidro Treviño on 25/09/24.
//

import SwiftUI

struct GenreItem: View {
    var song: Song
    var body: some View {
        VStack(alignment: .leading) {
            Image(song.AlbumImageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                
            Text(song.name)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    GenreItem(song: Modeldata().songs[0])
}
