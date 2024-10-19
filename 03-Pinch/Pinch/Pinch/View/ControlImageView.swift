//
//  ControlImageView.swift
//  Pinch
//
//  Created by Benjamin Golic on 19.10.24.
//

import SwiftUI
import SFSafeSymbols

struct ControlImageView: View {
  let icon: SFSymbol
  
    var body: some View {
      Image(systemSymbol: icon)
        .font(.system(size: 36))
    }
}

#Preview {
  ControlImageView(icon: .minusMagnifyingglass)
    .preferredColorScheme(.dark)
    .padding()
}
