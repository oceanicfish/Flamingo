//
//  TabButton.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/07.
//

import SwiftUI
import FirebaseAnalytics

struct TabButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    var foregroundColor : Color {colorScheme == .dark ? .black : .white}
    var conversedForegroundColor : Color {colorScheme == .dark ? .white : .black}
    var capsuleColor : Color {colorScheme == .dark ? .white : .black}
    
    var title : String
    @Binding var selected : String
    var namespace : Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()){
                selected = title
                Analytics.logEvent("CustomEvent_1", parameters: [
                  "CustomParameter_TabName": selected,
                  "CustomParameter_Action": "Tapped"
                  ])
            }
        }) {
            Text(title)
                .font(.system(size: 11))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? foregroundColor : conversedForegroundColor)
                .padding(.vertical, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, selected == title ? 20 : 0)
                .background(
                    ZStack {
                        if selected == title {
                            capsuleColor
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: namespace)
                        }
                    }
                )
        }
    }
    
}
