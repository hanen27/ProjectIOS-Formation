//
//  BackgroundsAndOverlay.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 17/11/2022.
//

import SwiftUI

struct BackgroundsAndOverlay: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 100, height: 100)
                .shadow(color:.gray,radius: 10, x: 0.0, y:10 )
                .overlay(Circle()
                    .fill(Color.pink)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("2")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            )
                         , alignment: .bottomTrailing)
            )
//        Circle()
//            .fill(Color.pink)
//            .frame(width: 100, height: 100, alignment: .center)
//            .overlay(
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundColor(.white))
//            .background(
//            Circle()
//                .fill(Color.purple)
//                .frame(width: 110, height: 110)
//            )
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//
//            .background(
//                //Color.red
//                //LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
//                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 100, height: 100, alignment: .center)
//            )
//
//
//            .background(Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing))
//                .frame(width: 120, height: 120, alignment: .center))
        
//
    }
}

struct BackgroundsAndOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundsAndOverlay()
    }
}
