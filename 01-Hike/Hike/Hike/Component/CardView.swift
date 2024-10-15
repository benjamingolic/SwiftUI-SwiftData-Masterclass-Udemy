//
//  CardView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI

struct CardView: View {
  var body: some View {
    ZStack {
      CustomBackgroundView()
      
      Circle()
        .fill(
          LinearGradient(
            colors: [.colorIndigoMedium, .colorSalmonLight],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .frame(width: 256, height: 256)
      
      Image("image-1")
        .resizable()
        .scaledToFit()
    }
    
  }
}

#Preview {
  CardView()
}
