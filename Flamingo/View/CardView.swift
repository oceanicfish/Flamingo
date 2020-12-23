//
//  CardView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/07.
//

import SwiftUI

var tabs = ["スタティック", "アニメーション", "インタラクティブ", "メディア"]

//class selectedCardViewModel: ObservableObject {
//
//    @Published var selected : Card?
//
//    func setCard(card: Card) {
//        self.selected = card
//    }
//
//    func clear() {
//        self.selected = nil
//    }
//}

//    .init(title: "Static One", subTitle: "Static Layout No.1", image: "square.stack.3d.down.right", tag: "スタティック", color: Color.green, content: AnyView(ARSceneView())),
//    .init(title: "Static Two", subTitle: "Static Layout No.1", image: "cube", tag: "スタティック", color: Color.red, content: AnyView(BlankView(selectedCard: $selectedCard))),
//    .init(title: "Static Three", subTitle: "Static Layout No.1", image: "rectangle.on.rectangle.angled", tag: "スタティック", color: Color.pink, content: AnyView(BlankView(selectedCard: $selectedCard))),
//    .init(title: "Static Four", subTitle: "Static Layout No.1", image: "rectangle.and.arrow.up.right.and.arrow.down.left", tag: "スタティック", color: Color.blue, content: AnyView(BlankView(selectedCard: $selectedCard))),
//    .init(title: "Animation One", subTitle: "Animation Layout No.1", image: "square.stack.3d.down.dottedline", tag: "アニメーション", color: Color.yellow, content: AnyView(BlankView(selectedCard: $selectedCard))),
//    .init(title: "Interactive One", subTitle: "Interactive Layout No.1", image: "livephoto", tag: "インタラクティブ", color: Color.purple, content: AnyView(BlankView(selectedCard: $selectedCard))),
//    .init(title: "AR AVPlayer", subTitle: "play video in AR sence", image: "arkit", tag: "メディア", color: Color.orange, content: AnyView(ARSceneView()))

struct CardView : View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var selected = tabs[0]
    @State var selectedCard : Card?
    @State var presentARScene : Bool = false
    @State var offset: CGSize = .zero
    @Namespace var namespace
    
    var cards : [Card]
    
    init() {
        self.cards = []
        let stateOneCard : Card = Card(title: "Static One",
                                       subTitle: "Static Layout No.1",
                                       image: "square.stack.3d.down.right",
                                       tag: "スタティック",
                                       color: Color.green,
                                       content: AnyView(BlankView(selectedCard: $selectedCard)))
        self.cards.append(stateOneCard)
        
    }
    
    var body: some View {
        // view transaction
        if (selectedCard != nil) {
            selectedCard?.content
        }else {
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
                                    IndividualCardView(item: card,
                                                       namespace: namespace,
                                                       selectedCard: $selectedCard)
                                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
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
