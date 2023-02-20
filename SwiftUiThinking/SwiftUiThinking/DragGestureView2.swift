//
//  DragGestureView2.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 18/11/2022.
//

import SwiftUI

struct DragGestureView2: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.845
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                DragGesture()
                    .onChanged {
                        value in
                        withAnimation(.spring()) {
                           
                            currentDragOffsetY = value.translation.height
                        }
                    }
                    .onEnded {
                        value in
                        withAnimation(.spring()){

                        if currentDragOffsetY < -150 {
                            endingOffsetY = -startingOffsetY
                            currentDragOffsetY = 0
                        } else if endingOffsetY != 0  && currentDragOffsetY > 150 {
                            endingOffsetY = 0
                            currentDragOffsetY = 0
                        }
                        
                            currentDragOffsetY = 0
                        }
                    }
                )
        }
        .ignoresSafeArea(edges: .bottom)    }
}

struct DragGestureView2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView2()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for yoour app. This is my favorite swiftui course and i recommend to all of my friends to subscribe to swiftUi Thinking")
                .padding()
                .multilineTextAlignment(.center)
            
            Text("Create an account")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
