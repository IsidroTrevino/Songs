//
//  AddNewSong.swift
//  Songs
//
//  Created by Isidro Treviño on 29/10/24.
//

import SwiftUI
import PhotosUI

struct AddNewSong: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var songLength = ""
    @State private var genre = ""
    @State private var plays = ""
    @State private var album = ""
    @State private var band = ""
    @State private var description = ""
    @State private var appleMusicURL = ""
    @State private var isFeatured = false // New state for the toggle
    @State private var bandImage: UIImage?
    @State private var albumImage: UIImage?
    @State private var selectedBandImageItem: PhotosPickerItem?
    @State private var selectedAlbumImageItem: PhotosPickerItem?
    @State private var showBandImagePicker = false
    @State private var showAlbumImagePicker = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Song Name", text: $name)
                TextField("Length", text: $songLength)
                TextField("Genre", text: $genre)
                TextField("Plays", text: $plays)
                TextField("Album", text: $album)
                TextField("Band", text: $band)
                TextField("Description", text: $description)
                TextField("Apple Music URL", text: $appleMusicURL)
                
                Toggle(isOn: $isFeatured) {
                    Text("Mark as Featured")
                }

                Section(header: Text("Band Image")) {
                    Button(action: { showBandImagePicker = true }) {
                        if let bandImage = bandImage {
                            Image(uiImage: bandImage)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            Label("Select Band Image", systemImage: "photo")
                        }
                    }
                    .photosPicker(isPresented: $showBandImagePicker, selection: $selectedBandImageItem, matching: .images)
                    .onChange(of: selectedBandImageItem) { newItem in
                        loadImage(from: newItem) { image in
                            self.bandImage = image
                        }
                    }
                }
                
                Section(header: Text("Album Cover Image")) {
                    Button(action: { showAlbumImagePicker = true }) {
                        if let albumImage = albumImage {
                            Image(uiImage: albumImage)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            Label("Select Album Cover", systemImage: "photo")
                        }
                    }
                    .photosPicker(isPresented: $showAlbumImagePicker, selection: $selectedAlbumImageItem, matching: .images)
                    .onChange(of: selectedAlbumImageItem) { newItem in
                        loadImage(from: newItem) { image in
                            self.albumImage = image
                        }
                    }
                }
            }
            .navigationTitle("Add New Song")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveNewSong()
                    }
                    .disabled(name.isEmpty || songLength.isEmpty || genre.isEmpty)
                }
            }
        }
    }

    private func saveNewSong() {
        let bandImageName = saveImage(bandImage, prefix: "band_")
        let albumImageName = saveImage(albumImage, prefix: "album_")
        
        let newSong = Song(name: name, songLength: songLength, genre: genre, plays: plays,  isFeatured: isFeatured,
                           album: album, band: band, description: description,
                           bandImageName: bandImageName, albumImageName: albumImageName,
                           url: URL(string: appleMusicURL))
        context.insert(newSong)
        dismiss()
    }

    private func loadImage(from item: PhotosPickerItem?, completion: @escaping (UIImage?) -> Void) {
        item?.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let data = data, let image = UIImage(data: data) {
                        completion(image)
                    } else {
                        completion(nil)
                    }
                case .failure:
                    completion(nil)
                }
            }
        }
    }

    private func saveImage(_ image: UIImage?, prefix: String) -> String {
        guard let image = image, let data = image.pngData() else { return "" }
        let filename = "\(prefix)\(UUID().uuidString).png"
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
        try? data.write(to: url)
        return filename
    }
}

#Preview {
    AddNewSong()
}
