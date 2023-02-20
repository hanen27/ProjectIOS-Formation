//
//  MultipleSheets.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 21/11/2022.
//

import SwiftUI
struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}
struct MultipleSheets: View {
    @State var selectedModel: RandomModel = RandomModel(title: "starting Tilte")
    @State var selectedIndex: Int = 0
    @State var showSheet: Bool = false
    var body: some View {
        VStack (spacing: 20) {
            Button("Button 1") {
                selectedIndex = 1
                selectedModel = RandomModel(title: "One")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedIndex = 2
                selectedModel = RandomModel(title: "Two")
                showSheet.toggle()

            }
        }
        .sheet(isPresented: $showSheet, content: {
            NextScreen(selectedModel: $selectedModel)
           

        })
    }
}
struct NextScreen: View {
    @Binding var  selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheets_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheets()
    }
}
