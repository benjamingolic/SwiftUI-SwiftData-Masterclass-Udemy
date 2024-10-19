//
//  OnboardingView.swift
//  Restart
//
//  Created by Benjamin Golic on 16.10.24.
//

import SwiftUI

struct OnboardingView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  @State private var isAnimating: Bool = false
  @State private var imageOffset: CGSize = .zero // => CGSize(width: 0, height: 0)
  @State private var indicatorOpacity: Double = 1.0
  @State private var TextTitle: String = "Share."
  
  let hapticFeedback = UINotificationFeedbackGenerator()
  
  var body: some View {
    ZStack {
      Color(.colorBlue)
        .ignoresSafeArea(.all, edges: .all)
      VStack(spacing: 20) {
        Spacer()
        
        VStack(spacing: 0) {
          Text(TextTitle) // Problem: SwiftUI does not consider this string-value-change to a view-change
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .transition(.opacity)
            .id(TextTitle) // Problem-Solution: tell SwiftUI that the view is no longer the same view
          
          Text("""
          It's not how much we give but
          how much love we put into giving.
          """)
          .font(.title3)
          .fontWeight(.light)
          .foregroundStyle(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)
        
        ZStack {
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
            .offset(x: imageOffset.width * -1)
            .blur(radius: abs(imageOffset.width / 5))
            .animation(.easeOut(duration: 1), value: imageOffset)
          
          Image("character-1")
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 0.5), value: isAnimating)
            .offset(x: imageOffset.width * 1.2, y: 0)
            .rotationEffect(.degrees(Double(imageOffset.width / 20)))
            .gesture(
              DragGesture()
                .onChanged { value in
                  if abs(imageOffset.width) <= 150 {
                    imageOffset = value.translation
                    
                    withAnimation(.linear(duration: 0.25)) {
                      indicatorOpacity = 0
                      TextTitle = "Give."
                    }
                  }
                }
                .onEnded { _ in
                  imageOffset = .zero
                  
                  withAnimation(.linear(duration: 0.25)) {
                    indicatorOpacity = 1
                    TextTitle = "Share."
                  }
                }
            )
            .animation(.easeOut(duration: 1), value: imageOffset)
        }
        .overlay (
          Image(systemSymbol: .arrowLeftAndRightCircle)
            .font(.system(size: 44, weight: .ultraLight))
            .foregroundStyle(.white)
            .offset(y: 20)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
            .opacity(indicatorOpacity)
          , alignment: .bottom
        )
        
        Spacer()
        
        ZStack {
          Capsule()
            .fill(.white.opacity(0.2))
          
          Capsule()
            .fill(.white.opacity(0.2))
            .padding(8)
          
          Text("Get Started")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .offset(x: 20)
          
          HStack {
            Capsule()
              .fill(.colorRed)
              .frame(width: buttonOffset + 80)
            
            Spacer()
          }
          
          HStack {
            ZStack {
              Circle()
                .fill(.colorRed)
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemSymbol: .chevronRight2)
                .font(.system(size: 24, weight: .bold))
            }
            .foregroundStyle(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .offset(x: buttonOffset)
            .gesture(
              DragGesture()
                .onChanged { value in
                  if value.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                    buttonOffset = value.translation.width
                  }
                }
                .onEnded { _ in
                  withAnimation(Animation.easeOut(duration: 0.4)) {
                    if buttonOffset > buttonWidth / 2 {
                      hapticFeedback.notificationOccurred(.success)
                      playSound(sound: "chimeup", type: "mp3")
                      buttonOffset = buttonWidth - 80
                      isOnboardingViewActive = false
                    } else {
                      hapticFeedback.notificationOccurred(.warning)
                      buttonOffset = 0
                    }
                  }
                }
            )
            
            Spacer()
          }
        }
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimating)
      }
    }
    .onAppear {
      isAnimating = true
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  OnboardingView()
}
