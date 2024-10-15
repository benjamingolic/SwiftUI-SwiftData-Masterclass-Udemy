//
//  CustomButtonView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI
import SFSafeSymbols

struct CustomButtonView: View {
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient (
            colors: [.colorGreenLight, .colorGreenMedium],
            startPoint: UnitPoint.top,
            endPoint: .bottom
          )
        )
      
      Circle()
        .stroke(
          LinearGradient (
            colors: [.colorGrayLight, .colorGrayMedium],
            startPoint: .top,
            endPoint: .bottom),
          lineWidth: 4
        )
      
      Image(systemSymbol: .figureHiking)
        .fontWeight(.black)
        .font(.system(size: 30))
        .foregroundStyle(
          LinearGradient (
            colors: [.colorGrayLight, .colorGrayMedium],
            startPoint: .top,
            endPoint: .bottom
          )
        )
    }
    .frame(width: 58, height: 58)
  }
}

#Preview {
  CustomButtonView()
}
