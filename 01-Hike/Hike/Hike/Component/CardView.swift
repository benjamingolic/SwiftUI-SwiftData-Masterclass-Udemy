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
            }) {
              CustomButtonView()
            }
          }
          
          Text("Fun and enjoyable outdoor activity for friends and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundStyle(.colorGrayMedium)
        }
        .padding(.horizontal, 30)
        
        ZStack {
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
    .frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
