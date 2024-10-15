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
      CustomBackgroundView()
      
      VStack {
        VStack(alignment: .leading) {
          HStack {
            Text("Hiking")
              .fontWeight(.black)
              .font(.system(size: 52))
              .foregroundStyle(
                LinearGradient(
                  colors: [.colorGrayLight, .colorGrayMedium],
                  startPoint: .top,
                  endPoint: .bottom
                )
              )
            
            Spacer()
            
            Button(action: {
              print("Button was pressed.")
              isSheetShowing.toggle()
            }) {
              CustomButtonView()
            }
            .sheet(isPresented: $isSheetShowing) {
              SettingsView()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
          }
          
          Text("Fun and enjoyable outdoor activity for friends and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundStyle(.colorGrayMedium)
        }
        .padding(.horizontal, 30)
        
        ZStack {
          CustomCircleView()
          
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber)
        }
        
        Button(action: {
          randomImageNumber()
        }) {
          Text("Explore More")
            .fontWeight(.heavy)
            .font(.title2)
            .foregroundStyle(
              LinearGradient(
                colors: [.colorGreenLight, .colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
        
      }
    }
    .frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
