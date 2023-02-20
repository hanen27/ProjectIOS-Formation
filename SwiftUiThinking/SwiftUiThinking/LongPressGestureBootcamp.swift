//
//  LongPressGestureBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 18/11/2022.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State var isComplete: Bool = false
    @State var isSucess: Bool = false
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSucess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            HStack{
                Text("Click Here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50){
                        (isPressing) in
                        if  isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete.toggle()
                            }
                            
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSucess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform:{
                        withAnimation(.easeInOut){
                            isSucess = true
                        }
                    }
                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            isComplete = false

                        }
                    }
                
            }
          
        }
//        Text(isComplete ? "Complete" :  "Not complete")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture(minimumDuration: 5.0, maximumDistance: 1){
//                isComplete.toggle()
//            }
//
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
