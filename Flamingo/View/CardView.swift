//
//  CardView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/07.
//

import SwiftUI

var tabs = ["スタティック", "アニメーション", "インタラクティブ", "メディア"]

var cards: [Card] = [
    Card(title: "Static One", subTitle: "Static Layout No.1", image: "square.stack.3d.down.right", tag: "スタティック", color: Color.green, content: AnyView(BlankView())),
    Card(title: "Static Two", subTitle: "Static Layout No.1", image: "cube", tag: "スタティック", color: Color.red, content: AnyView(BlankView())),
    Card(title: "Static Three", subTitle: "Static Layout No.1", image: "rectangle.on.rectangle.angled", tag: "スタティック", color: Color.pink, content: AnyView(ARSceneView())),
    Card(title: "Static Four", subTitle: "Static Layout No.1", image: "rectangle.and.arrow.up.right.and.arrow.down.left", tag: "スタティック", color: Color.blue, content: AnyView(ARSceneView())),
    Card(title: "Animation One", subTitle: "Animation Layout No.1", image: "square.stack.3d.down.dottedline", tag: "アニメーション", color: Color.yellow, content: AnyView(ARSceneView())),
    Card(title: "Interactive One", subTitle: "Interactive Layout No.1", image: "livephoto", tag: "インタラクティブ", color: Color.purple, content: AnyView(ARSceneView())),
    Card(title: "AR AVPlayer", subTitle: "play video in AR sence", image: "arkit", tag: "メディア", color: Color.orange, content: AnyView(ARSceneView()))
]

struct CardView : View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var selected = tabs[0]
    @Namespace var namespace
    
    var body: some View {
        NavigationView {
            // view transaction
            VStack {
                // Header Area
                HStack {
                    // Button Left
                    Button(action: {

                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }.padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    // Spacer
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    // Button Right
                    Button(action: {
                        fatalError()
                    }) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 25))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }.padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal, 5)
                .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                // Scrollable Area
                ScrollView {
                    VStack {
                        // Title Area
                        HStack {
                            Text("レイアウト展示")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Spacer()
                        }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                        // Tab Buttons Area
                        HStack {
                            ForEach(tabs, id: \.self) { tab in
                                TabButton(title: tab, selected: $selected, namespace: namespace)
                                // even spacing...
                                if tabs.last != tab {
                                    Spacer()
                                }
                            }
                        }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                        // Card Area
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2),content: {
                            ForEach(cards) { card in
                                if card.tag == selected {
                                    NavigationLink(
                                        destination: card.content.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)) {
                                            IndividualCardView(item: card, namespace: namespace).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        }
                                }
                            }
                        })
                    }
                    .padding(.top, 5)
                }

                Spacer()
            }
            .gesture(swipeGesture)
            .animation(.linear)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    var swipeGesture : some Gesture {
        // To avoid conflict with SrcllView, Setting a minimum distance is necessary.
        DragGesture(minimumDistance: 30.0, coordinateSpace: .global)
            .onEnded({ value in
                let i = tabs.firstIndex(of: selected)
                // swipe to right ->>
                if (value.translation.width > 100) {
                    if i! > 0 {
                        selected = tabs[i! - 1]
                    }
                }
                // swipe to left <<-
                if (value.translation.width < -100) {
                    if i! < 3 {
                        selected = tabs[i! + 1]
                    }
                }
        })
    }
}
