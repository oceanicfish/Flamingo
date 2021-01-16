//
//  Card.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/10.
//

import SwiftUI

struct Card : Identifiable {
    var id = UUID().uuidString
    var title : String
    var subTitle : String
    var image : String
    var tag : String
    var color : Color
    var content : AnyView
}

//    .init(title: "Static One", subTitle: "Static Layout No.1", image: "square.stack.3d.down.right", tag: "スタティック", color: Color.green, content: AnyView(ARSceneView())),
//    .init(title: "Static Two", subTitle: "Static Layout No.1", image: "cube", tag: "スタティック", color: Color.red, content: AnyView(BlankView())),
//    .init(title: "Static Three", subTitle: "Static Layout No.1", image: "rectangle.on.rectangle.angled", tag: "スタティック", color: Color.pink, content: AnyView(ARSceneView())),
//    .init(title: "Static Four", subTitle: "Static Layout No.1", image: "rectangle.and.arrow.up.right.and.arrow.down.left", tag: "スタティック", color: Color.blue, content: AnyView(ARSceneView())),
//    .init(title: "Animation One", subTitle: "Animation Layout No.1", image: "square.stack.3d.down.dottedline", tag: "アニメーション", color: Color.yellow, content: AnyView(ARSceneView())),
//    .init(title: "Interactive One", subTitle: "Interactive Layout No.1", image: "livephoto", tag: "インタラクティブ", color: Color.purple, content: AnyView(ARSceneView())),
//    .init(title: "AR AVPlayer", subTitle: "play video in AR sence", image: "arkit", tag: "メディア", color: Color.orange, content: AnyView(ARSceneView()))
//]
