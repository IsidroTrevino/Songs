//
//  GenreItem.swift
//  Songs
//
//  Created by Isidro Treviño on 25/09/24.
//

import SwiftUI

struct GenreItem: View {
    var song: Song
    
    var albumImage: UIImage? {
        loadImage(named: song.albumImageName)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let albumImage = albumImage {
                Image(uiImage: albumImage)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(5)
            } else {
                Image(systemName: "questionmark.app")
                    .resizable()
                    .frame(width: 155, height: 155)
                    .foregroundColor(.gray)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
            }
            
            Text(song.name)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
        .padding(.leading, 15)
    }
    
    private func loadImage(named name: String) -> UIImage? {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
        if FileManager.default.fileExists(atPath: documentsURL.path) {
            return UIImage(contentsOfFile: documentsURL.path)
        }
        return UIImage(named: name)
    }
}

#Preview {
    GenreItem(song: SampleData.shared.song)
        .modelContainer(SampleData.shared.modelContainer)
}
