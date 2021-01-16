//
//  ARSceneView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/10.
//

import SwiftUI
import ARKit
import RealityKit

struct ARSceneView : View {
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    var body: some View {
        NavigationView{
            ZStack {
                ARViewContainer().edgesIgnoringSafeArea(.all)
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitle("", displayMode: .inline)
    }
    
    struct ARViewContainer : UIViewRepresentable {
        
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {
            
        }
    }
    
}
