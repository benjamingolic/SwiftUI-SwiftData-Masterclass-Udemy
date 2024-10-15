//
//  SwiftUIView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical)
      .padding(.horizontal, 30)
      .background(
        configuration.isPressed
          ? LinearGradient(
              colors: [.blue.opacity(0.7), .green.opacity(0.7)],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          : LinearGradient(
              colors: [.blue, .green],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
      )
      .foregroundColor(.white)
      .cornerRadius(20)
      .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
      .shadow(
        color: .black.opacity(configuration.isPressed ? 0.05 : 0.1),
        radius: 5, x: 0, y: 4
      )
  }
}

