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
  @State private var isDrawerOpen: Bool = false
  @State private var chevronSymbol: SFSymbol = .chevronCompactLeft
  
  let pages:[Page] = pagesData
  @State private var currentPage: Int = 1
  
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
        
        Image(pages[currentPage-1].imageName)
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
          .gesture(
            MagnifyGesture()
              .onChanged { value in
                withAnimation(.linear(duration: 1)) {
                  if imageScale >= 1 && imageScale <= 5 {
                    imageScale = value.magnification
                  } else if imageScale > 5 {
                    imageScale = 5
                  }
                }
              }
              .onEnded { _ in
                if imageScale > 5 {
                  imageScale = 5
                } else if imageScale <= 1 {
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
      .overlay(
        HStack(spacing: 12) {
          Image(systemSymbol: chevronSymbol)
            .resizable()
            .scaledToFit()
            .frame(height: 40)
            .padding(8)
            .foregroundStyle(.secondary)
            .onTapGesture {
              chevronSymbol = isDrawerOpen ? .chevronCompactLeft : .chevronCompactRight
              withAnimation(.easeOut) {
                isDrawerOpen.toggle()
              }
            }
          ForEach(pages) { page in
            Image(page.thumbName)
              .resizable()
              .scaledToFit()
              .frame(width: 80)
              .cornerRadius(8)
              .shadow(radius: 4)
              .opacity(isDrawerOpen ? 1 : 0)
              .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
              .onTapGesture {
                isAnimating = true
                withAnimation(.easeOut) {
                  currentPage = page.id
                }
              }
          }
          Spacer()
        }
          .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
          .background(.ultraThinMaterial)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .opacity(isAnimating ? 1 : 0)
          .frame(width: 260)
          .padding(.top, UIScreen.main.bounds.height / 12)
          .offset(x: isDrawerOpen ? 20 : 215)
        , alignment: .topTrailing
      )
    }
  }
}

#Preview {
  ContentView()
}
