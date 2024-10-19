//
//  ContentView.swift
//  Pinch
//
//  Created by Benjamin Golic on 19.10.24.
//

import SwiftUI

struct ContentView: View {
  @State private var isAnimating: Bool = false
  @State private var imageScale: CGFloat = 1
  @State private var imageOffset: CGSize = .zero // CGSize(width: 0, height: 0)
  
  func resetImageState() {
    return withAnimation(.spring()) {
      imageScale = 1
      imageOffset = .zero
    }
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        Image("magazine-front-cover")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .cornerRadius(10)
          .padding()
          .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
          .opacity(isAnimating ? 1 : 0)
          .offset(x: imageOffset.width, y: imageOffset.height)
          .animation(.linear(duration: 0.5), value: isAnimating)
          .scaleEffect(imageScale)
          .onTapGesture(count: 2, perform: {
            if imageScale == 1 {
              withAnimation(.spring()) {
                imageScale = 5
              }
            } else {
              resetImageState()
            }
          })
          .gesture(
            DragGesture()
              .onChanged { value in
                withAnimation(.linear(duration: 1)) {
                  imageOffset = value.translation
                }
              }
              .onEnded { _ in
                if imageScale <= 1 {
                  resetImageState()
                }
              }
          )
      }
      .navigationTitle("Pinch & Zoom")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear {
        isAnimating = true
      }
    }
  }
}

#Preview {
  ContentView()
}
