//
//  IndividualCardView.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/10.
//

import SwiftUI

struct IndividualCardView : View {
    var item : Card
    var namespace : Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(item.tag)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.6))
            
            }.padding(.bottom, 10)
            .padding(.top, 10)
            
            HStack {
                Spacer()
                Image(systemName: item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 60, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                Spacer()
            }.padding(.all, 10)
            
            HStack {
                VStack {
                    Text(item.title)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(item.subTitle)
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }.padding(.horizontal, 10)
            }
            
            Spacer(minLength: 50)
        }
        .background(item.color.cornerRadius(10))
        
    }
    
}
