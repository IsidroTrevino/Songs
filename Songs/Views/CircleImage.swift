//
//  CircleImage.swift
//  Songs
//
//  Created by Isidro Treviño on 24/09/24.
//

import SwiftUI

struct CircleImage: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.black, lineWidth: 5)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: "PabloHoney")
}
