//
//  ContentView.swift
//  Pinch
//
//  Created by Benjamin Golic on 19.10.24.
//

import SwiftUI
import SFSafeSymbols

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
        Color.clear
        
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
      .overlay(
        InfoPanelView(scale: imageScale, offset: imageOffset)
          .padding(.horizontal)
          .padding(.top, 30)
        , alignment: .top
      )
      .overlay(
        Group {
          HStack {
            Button(action: {
              withAnimation(.spring()) {
                if imageScale > 1 {
                  imageScale -= 1
                  
                  if imageScale <= 1 {
                    resetImageState()
                  }
                }
              }
            }) {
              ControlImageView(icon: .minusMagnifyingglass)
            }
            Button(action: {
              resetImageState()
            }) {
              ControlImageView(icon: .arrowUpLeftAndDownRightMagnifyingglass)
            }
            Button(action: {
              withAnimation(.spring()) {
                if imageScale < 5 {
                  imageScale += 1
                  
                  if imageScale > 5 {
                    imageScale = 5
                  }
                }
              }
            }) {
              ControlImageView(icon: .plusMagnifyingglass)
            }
          }
          .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
          .background(.ultraThinMaterial)
          .cornerRadius(12)
          .opacity(isAnimating ? 1 : 0)
        }
          .padding(.bottom, 30)
        , alignment: .bottom
      )
    }
  }
}

#Preview {
  ContentView()
}
