//
//  BlankView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/15.
//

import SwiftUI

struct BlankView: View {
    @Binding var selectedCard : Card?
    var body: some View {
        VStack {
            Text("Blank View")
        }
        .onTapGesture(count: 2, perform: {
            print("double tapped")
            selectedCard = nil
        })
    }
}
