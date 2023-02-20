//
//  MaskBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 21/11/2022.
//

import SwiftUI

struct MaskBootcamp: View {
    @State var rating: Int = 0
    var body: some View {
        ZStack {
            starsView
                .overlay (
                    overlayView.mask(starsView)
                    
                )
        }
    }
    private var starsView: some View {
        HStack {
            ForEach( 1..<6){ index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
            
        }
    }
    private var overlayView: some View {
        GeometryReader {
                geomtry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.yellow)
                        .frame (width: CGFloat(rating) / 5 * geomtry.size.width)
                }
            }
        .allowsTightening(false)
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
