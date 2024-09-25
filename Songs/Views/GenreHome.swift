//
//  GenreHome.swift
//  Songs
//
//  Created by Isidro Treviño on 25/09/24.
//

import SwiftUI

struct GenreHome: View {
    @Environment(Modeldata.self) var modelData
    var body: some View {
        NavigationSplitView {
            List {
                Image(modelData.features[6].AlbumImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self){
                    key in GenreRow(genreName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("Featured")
        } detail: {
            Text("Select a song")
        }
    }
}

#Preview {
    GenreHome()
        .environment(Modeldata())
}
