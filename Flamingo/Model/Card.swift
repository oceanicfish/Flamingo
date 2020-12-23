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
