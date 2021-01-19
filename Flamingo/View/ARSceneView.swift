//
//  ARSceneView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/10.
//

import SwiftUI
import ARKit
import RealityKit
import AVKit

struct ARSceneView : View {
    
    @State var objectIsPlaced : Bool = false
    @State var isFirstTime : Bool = true
    
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    var body: some View {
        NavigationView{
            ZStack {
                ARViewContainer(objectIsPlaced: $objectIsPlaced, isFirstTime: $isFirstTime)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .onLongPressGesture(minimumDuration: 2, perform: {
                print("[AR Scene] objectIsPlaced updated.(2)")
            if !objectIsPlaced {
                objectIsPlaced = true
            }
        })
    }
    
    struct ARViewContainer : UIViewRepresentable {
        
        @Binding var objectIsPlaced : Bool
        @Binding var isFirstTime : Bool
        
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
            
            print("[AR Scene] creating is done.")
            
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {
            
            print("[AR Scene] updating ui view...")
            
            if objectIsPlaced && isFirstTime {
                
                print("[AR Scene] set up AVPlayer")
                let asset = AVURLAsset(url: URL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!)
                let playerItem = AVPlayerItem(asset: asset)
                let player = AVPlayer()
                let videoMaterial = VideoMaterial(avPlayer: player)
                player.replaceCurrentItem(with: playerItem)
                
                let videoPlane = try!
                    ModelEntity.loadModel(named: "monitor.usdz")
                videoPlane.scale = SIMD3<Float>(x: 3.0, y: 3.0, z: 3.0)
                videoPlane.model?.materials[1] = videoMaterial
                
//                let videoPlane = ModelEntity(mesh: .generatePlane(width: 0.8, depth: 0.45), materials: [videoMaterial])
                
                let anchorEntity = AnchorEntity(plane: .horizontal)
                anchorEntity.addChild(videoPlane)
                uiView.scene.addAnchor(anchorEntity)
                
                player.play()
                
                isFirstTime = false
            }
            
            print("[AR Scene] updating is done.")
            
        }
    }
    
}
