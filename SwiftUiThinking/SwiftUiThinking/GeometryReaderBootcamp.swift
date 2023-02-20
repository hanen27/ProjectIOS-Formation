//
//  GeometryReaderBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 21/11/2022.
//

import SwiftUI
func getPercentage(geo: GeometryProxy)-> Double {
    let maxDistance = UIScreen.main.bounds.width / 2
    let currentX = geo.frame(in: .global).midX
    return Double(1 - (currentX / maxDistance))
}
struct GeometryReaderBootcamp: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true, content: {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                 
                }
            }
        })
//        GeometryReader(content: {
//            geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                .fill(Color.red)
//                .frame(width: UIScreen.main.bounds.width * 0.6666)
//                Rectangle().fill(Color.white)
//
//            }
//            .ignoresSafeArea()
//        })
      
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
