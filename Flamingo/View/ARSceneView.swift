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
            
            print("[AR Scene] creating ui view...")
            
            let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
            
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal, .vertical]
            config.environmentTexturing = .automatic
            
            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
                config.sceneReconstruction = .mesh
            }
            
            arView.session.run(config)
            
            let modelEntity = try!
                ModelEntity.loadModel(named: "tv_retro.usdz")
            let anchorEntity = AnchorEntity(plane: .any)
            anchorEntity.addChild(modelEntity)
            arView.scene.addAnchor(anchorEntity)
            
            print("[AR Scene] creating is done.")
            
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {
            
            print("[AR Scene] updating ui view...")
            
            let modelEntity = try!
                ModelEntity.loadModel(named: "tv_retro.usdz")
            let anchorEntity = AnchorEntity(plane: .any)
            anchorEntity.addChild(modelEntity)
            uiView.scene.addAnchor(anchorEntity)
            
            print("[AR Scene] updating is done.")
            
        }
    }
    
}
