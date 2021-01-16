//
//  ARSceneView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/10.
//

import SwiftUI

struct ARSceneView : View {
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Text("AR Sence View")
                        Spacer()
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitle("", displayMode: .inline)
    }
    
}
