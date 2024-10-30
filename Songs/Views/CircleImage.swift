//
//  CircleImage.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image?
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                image
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            } else if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }
        }
    }
}


#Preview {
    CircleImage(image: nil, uiImage: UIImage(named: "PabloHoney"))
}
