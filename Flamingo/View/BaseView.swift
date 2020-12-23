//
//  BaseView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/21.
//

import SwiftUI

struct BaseView<Content : View>: View {
    var content : () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(content: content)
    }
}
