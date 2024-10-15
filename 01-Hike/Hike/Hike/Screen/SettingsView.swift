//
//  SettingsView.swift
//  Hike
//
//  Created by Benjamin Golic on 15.10.24.
//

import SwiftUI
import SFSafeSymbols

struct SettingsView: View {
  private let altAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Camera",
    "AppIcon-Map",
    "AppIcon-Backpack",
    "AppIcon-Campfire",
    "AppIcon-Mushroom"
  ]
  
  var body: some View {
    List {
      Section {
        HStack {
          Spacer()
          Image(systemSymbol: .laurelLeading)
            .font(.system(size: 80, weight: .black))
          
          VStack {
            Text("Hike")
              .font(.system(size: 66, weight: .black))
            
            Text("Editors Choice")
              .fontWeight(.medium)
          }
          Image(systemSymbol: .laurelTrailing)
            .font(.system(size: 80, weight: .black))
          
          Spacer()
        }
        .foregroundStyle(
          LinearGradient (
            colors: [.colorGreenLight, .colorGreenMedium, .colorGreenDark],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .padding(.top, 8)
        
        VStack {
          Text("Where can you find \nperfect tracks?")
            .font(.title2)
            .fontWeight(.heavy)
          
          Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
            .font(.footnote)
            .italic()
          
          Text("Dust off the boots! It's time for a walk.")
            .fontWeight(.heavy)
            .foregroundStyle(.colorGrayMedium)
        }
        .multilineTextAlignment(.center)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
      }
      .listRowSeparator(.hidden)
      
      Section(header: Text("Alternate Icons")) {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(altAppIcons.indices, id: \.self) { index in
              Button(action: {
                print("Icon \(altAppIcons[index]) was selected.")
                
                UIApplication.shared.setAlternateIconName(altAppIcons[index]) { error in
                  if error != nil {
                    print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                  } else {
                    print("Success! You have changed the app's icon to \(altAppIcons[index]).")
                  }
                }
              }) {
                Image("\(altAppIcons[index])-Preview")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .presentationCornerRadius(16)
              }
              .buttonStyle(.borderless)
            }
          }
        }
        .padding(.top, 12)
        
        Text("Choose your favourite app icon from the collection above.")
          .frame(minWidth: 0, maxWidth: .infinity)
          .multilineTextAlignment(.center)
          .foregroundStyle(.secondary)
          .font(.footnote)
          .padding(.bottom, 12)
      }
      .listRowSeparator(.hidden)
      
      Section (
        header: Text("ABOUT THE APP"),
        footer: HStack {
          Spacer()
          Text("Copyright © All right reserved.")
          Spacer()
        }
          .padding(.vertical, 8))
      {
        CustomListRowView(rowLabel: "Application", rowIcon: .appsIphone, rowContent: "Hike", rowTintColor: .blue)
        CustomListRowView(rowLabel: "Compatibility", rowIcon: .infoCircle, rowContent: "iOS, iPadOS", rowTintColor: .red)
        CustomListRowView(rowLabel: "Technology", rowIcon: .swift, rowContent: "Swift", rowTintColor: .orange)
        CustomListRowView(rowLabel: "Dependencies", rowIcon: .plus, rowContent: "SFSafeSymbols", rowTintColor: .orange)
        CustomListRowView(rowLabel: "Version", rowIcon: .gear, rowContent: "1.0", rowTintColor: .purple)
        CustomListRowView(rowLabel: "Developer", rowIcon: .ellipsisCurlybraces, rowContent: "Benjamin Golić", rowTintColor: .mint)
        CustomListRowView(rowLabel: "Course", rowIcon: .globe, rowTintColor: .pink, rowLinkLabel: "SwiftUIMasterclass", rowLinkDestination: "https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/")
        
      }
      
    }
  }
}

#Preview {
  SettingsView()
}
