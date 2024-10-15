//
//  CardView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI

struct CardView: View {
  
  @State private var imageNumber: Int = 1
  @State private var randNumber: Int = 1
  @State private var isSheetShowing: Bool = false
  
  func randomImageNumber() {
    print ("Old Image Number: \(imageNumber)")
    while randNumber == imageNumber {
      randNumber = Int.random(in: 1...5)
    }
    imageNumber = randNumber
    print("New Image Number: \(imageNumber)")
  }
  
  var body: some View {
    ZStack {
      Color(.systemBackground)
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        VStack(alignment: .leading, spacing: 8) {
          HStack {
            Text("Hiking")
              .font(.system(size: 48, weight: .bold, design: .rounded))
              .foregroundStyle(
                LinearGradient(
                  colors: [.blue, .green],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
            
            Spacer()
            
            Button(action: {
              isSheetShowing.toggle()
            }) {
              Image(systemSymbol: .figureHiking)
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(.primary)
                .padding()
                .background(
                  Circle()
                    .fill(Color.secondary.opacity(0.1))
                )
            }
            .sheet(isPresented: $isSheetShowing) {
              SettingsView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
          }
          
          Text("Fun and enjoyable outdoor activity for friends and families.")
            .font(.footnote)
            .foregroundColor(.secondary)
        }
        .padding(.horizontal, 30)
        
        ZStack {
          CustomCircleView()
          
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.easeInOut(duration: 0.3), value: imageNumber)
        }
        .padding(.top, 16)
        
        Button(action: {
          randomImageNumber()
        }) {
          Text("Explore More")
            .fontWeight(.bold)
            .font(.title3)
        }
        .buttonStyle(GradientButton())
        .padding(.top, 20)
      }
    }
    .frame(width: 320, height: 570)
    .cornerRadius(30)
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
  }
}

#Preview {
  CardView()
}
