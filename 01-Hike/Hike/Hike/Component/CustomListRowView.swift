//
//  CustomListRowView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI

import SwiftUI
import SFSafeSymbols

struct CustomListRowView: View {
  
  @State var rowLabel: String
  @State var rowIcon: SFSymbol
  @State var rowContent: String? = nil
  @State var rowTintColor: Color
  @State var rowLinkLabel: String? = nil
  @State var rowLinkDestination: String? = nil
  
  var body: some View {
    LabeledContent {
      if let content = rowContent {
        Text(content)
          .foregroundStyle(.primary)
          .fontWeight(.heavy)
      } else if let linkLabel = rowLinkLabel,
                let linkDestination = rowLinkDestination,
                let url = URL(string: linkDestination) {
        Link(linkLabel, destination: url)
          .foregroundStyle(.pink)
          .fontWeight(.heavy)
      } else {
        EmptyView()
      }
    } label: {
      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 8)
            .frame(width: 30, height: 30)
            .foregroundStyle(rowTintColor)
          Image(systemSymbol: rowIcon)
            .foregroundStyle(.white)
            .fontWeight(.semibold)
        }
        Text(rowLabel)
      }
    }
  }
}
