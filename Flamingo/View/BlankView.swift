//
//  BlankView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/15.
//

import SwiftUI

struct BlankView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    HStack{
                        Spacer()
                        Text("Blank View")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 50))
                        Spacer()
                    }.padding(.top, 60)
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}
