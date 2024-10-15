//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI

struct CustomBackgroundView: View {
  var body: some View {
    ZStack {
      Color(.colorGreenDark)
        .cornerRadius(40)
        .offset(y: 12)
      
      Color(.colorGreenLight)
        .cornerRadius(40)
        .offset(y: 3)
        .opacity(0.85)
      LinearGradient (
        colors: [.colorGreenLight, .colorGreenMedium],
        startPoint: .top,
        endPoint: .bottom
      )
      .cornerRadius(40)
    }
    .frame(width: 320, height: 570)
  }
}

#Preview {
  CustomBackgroundView()
}
