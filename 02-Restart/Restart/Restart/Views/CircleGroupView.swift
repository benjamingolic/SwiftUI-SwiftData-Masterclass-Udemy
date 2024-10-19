//
//  CircleGroupView.swift
//  Restart
//
//  Created by Benjamin Golic on 19.10.24.
//

import SwiftUI

struct CircleGroupView: View {
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
        .frame(width: 260, height: 260, alignment: .center)
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
        .frame(width: 260, height: 260, alignment: .center)
    } // end ZStack
  }
}

#Preview {
  ZStack {
    Color(.colorBlue)
      .ignoresSafeArea(.all, edges: .all)
    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
  }
}
