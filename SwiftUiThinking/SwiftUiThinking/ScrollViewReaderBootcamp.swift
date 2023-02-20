//
//  ScrollViewReaderBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 18/11/2022.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var scrollToIndex: Int = 0
    
    @State var text: String = ""
    var body: some View {
        VStack{
            TextField("Enter a # here ...", text: $text)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            Button("Scroll Now") {
                withAnimation(.spring()){
                    if let index = Int(text) {
                        scrollToIndex = index
                        
                    }

                }
            }
       
        ScrollView {
            ScrollViewReader(content: {
                proxy in
            
            ForEach(0..<50) { index in
                Text("This is item #\(index)")
                    .font(.headline)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
                    .id(index)


            }
            .onChange(of: scrollToIndex, perform: {
                value in
                withAnimation(.spring()){
                    
                    proxy.scrollTo(value, anchor:.top)
                }
            })
        })
             
    }
        }
}
        
    }

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
                             
