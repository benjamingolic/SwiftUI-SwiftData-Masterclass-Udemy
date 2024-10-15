//
//  CustomCircleView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI

struct CustomCircleView: View {
  @State private var isAnimated: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [.blue.opacity(0.1), .blue.opacity(0.2)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .onAppear {
          withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
            isAnimated.toggle()
          }
        }
      
      MotionAnimationView()
    }
    .frame(width: 256, height: 256)
  }
}

#Preview {
  CustomCircleView()
}
