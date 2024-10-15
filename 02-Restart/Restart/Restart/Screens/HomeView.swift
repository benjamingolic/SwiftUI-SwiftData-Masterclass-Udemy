//
//  HomeView.swift
//  Restart
//
//  Created by Benjamin Golic on 16.10.24.
//

import SwiftUI

struct HomeView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Home")
        .font(.largeTitle)
      
      Button(action: {
        isOnboardingViewActive = true
      }) {
        Text("Restart")
      }
    }
  }
}

#Preview {
  HomeView()
}
