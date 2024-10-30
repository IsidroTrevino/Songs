//
//  SongDetail.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI
import SwiftData

struct SongDetail: View {
    @Environment(\.modelContext) private var context
    
    var song: Song

    var bandImage: UIImage? {
        loadImage(named: song.bandImageName)
    }

    var albumImage: UIImage? {
        loadImage(named: song.albumImageName)
    }

    var body: some View {
        ScrollView {
            VStack {
                if let bandImage = bandImage {
                    Image(uiImage: bandImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                } else {
                    Image(song.bandImageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                CircleImage(image: albumImage == nil ? Image(song.albumImageName) : nil, uiImage: albumImage)
                    .frame(width: 300, height: 300)
                    .padding(.bottom, -120)
                    .offset(y: -120)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(song.name)
                            .font(.title)
                        
                        FavoriteButton(isSet: Binding(
                            get: { song.isFavorite },
                            set: { newValue in
                                song.isFavorite = newValue
                                try? context.save()
                            }
                        ))
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
                    Text(song.desc)
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                if let url = song.url {
                    Button(action: {
                        UIApplication.shared.open(url)
                    }) {
                        Label("See on Apple Music", systemImage: "play.circle")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
        }
        .navigationTitle(song.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func loadImage(named name: String) -> UIImage? {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
        if let image = UIImage(contentsOfFile: documentsURL.path) {
            return image
        }
        
        return UIImage(named: name)
    }
}

#Preview {
    NavigationStack {
        SongDetail(song: SampleData.shared.song)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
