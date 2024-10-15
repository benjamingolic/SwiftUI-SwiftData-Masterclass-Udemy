//
//  ContentView.swift
//  Restart
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI
import SFSafeSymbols

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  var body: some View {
    ZStack {
      if isOnboardingViewActive {
        OnboardingView()
      } else {
        HomeView()
      }
    }
  }
}

#Preview {
  ContentView()
}
