//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Benjamin Golic on 19.10.24.
//

import SwiftUI

struct InfoPanelView: View {
  var scale: CGFloat
  var offset: CGSize
  
  @State var isInfoPanelVisible: Bool = false

  let hapticFeedback = UINotificationFeedbackGenerator()
  
  var body: some View {
    HStack {
      Image(systemSymbol: .circleCircle)
        .symbolRenderingMode(.hierarchical)
        .resizable()
        .frame(width: 30, height: 30)
        .onLongPressGesture(minimumDuration: 1) {
          withAnimation(.easeOut) {
            isInfoPanelVisible.toggle()
            hapticFeedback.notificationOccurred(.success )
          }
        }
      
      Spacer()
      
      HStack(spacing: 2) {
        Image(systemSymbol: .arrowUpLeftAndArrowDownRight)
        Text(String(format: "%.2f", scale))
          .animation(.easeInOut, value: scale)
        
        Spacer()
        
        Image(systemSymbol: .arrowLeftAndRight)
        Text(String(format: "%.2f", offset.width))
          .animation(.easeInOut, value: offset.width)
        
        Spacer()
        
        Image(systemSymbol: .arrowUpAndDown)
        Text(String(format: "%.2f", offset.height))
          .animation(.easeInOut, value: offset.height)
        
        Spacer()
      }
      .font(.footnote)
      .padding(8)
      .background(.ultraThinMaterial)
      .cornerRadius(8)
      .frame(maxWidth: 420)
      .opacity(isInfoPanelVisible ? 1 : 0)
      
      Spacer()
    }
  }
}

#Preview {
  InfoPanelView(scale: 1, offset: .zero)
    .preferredColorScheme(.dark)
    .padding()
}
