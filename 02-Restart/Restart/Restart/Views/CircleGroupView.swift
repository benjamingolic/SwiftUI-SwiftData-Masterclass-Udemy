//
//  CircleGroupView.swift
//  Restart
//
//  Created by Benjamin Golic on 19.10.24.
//

import SwiftUI

struct CircleGroupView: View {
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  @State private var isAnimating: Bool = false
  @State private var pulsate: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
        .frame(width: 260, height: 260, alignment: .center)
        .scaleEffect(pulsate ? 1.1 : 0.9)
      
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
        .frame(width: 260, height: 260, alignment: .center)
        .scaleEffect(pulsate ? 1.1 : 0.9)
    }
    .blur(radius: isAnimating ? 0 : 10)
    .opacity(isAnimating ? 1 : 0)
    .scaleEffect(isAnimating ? 1 : 0.5)
    .animation(.easeOut(duration: 1), value: isAnimating)
    .onAppear {
      isAnimating = true
      withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
        pulsate = true
      }
    }
  }
}

#Preview {
  ZStack {
    Color(.colorBlue)
      .ignoresSafeArea(.all, edges: .all)
    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
  }
}
