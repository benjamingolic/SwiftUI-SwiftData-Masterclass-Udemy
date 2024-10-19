//
//  HomeView.swift
//  Restart
//
//  Created by Benjamin Golic on 16.10.24.
//

import SwiftUI

struct HomeView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false

  @State private var isAnimating: Bool = false
  
  var body: some View {
    VStack(spacing: 20) {
      Spacer()
      
      ZStack {
        CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
        
        Image("character-2")
          .resizable()
          .scaledToFit()
          .padding()
          .offset(y: isAnimating ? 35 : -35)
          .animation(
            Animation
              .easeInOut(duration: 4)
              .repeatForever(), value: isAnimating
          )
      } // end ZStack | Center
      
      Text("""
          The time that leads to mastery is 
          dependent on the intensity of our focus
        """)
      .font(.title3)
      .fontWeight(.light)
      .foregroundStyle(.secondary)
      .multilineTextAlignment(.center)
      .padding()
      
      
      Spacer()
      
      Button(action: {
        withAnimation {
          isOnboardingViewActive = true
        }        
      }) {
        Image(systemSymbol: .arrowTriangle2CirclepathCircleFill)
          .imageScale(.large)
        
        Text("Restart")
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
      }
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.capsule)
      .controlSize(.large)
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        isAnimating = true
      }
    }
  }
}

#Preview {
  HomeView()
}
