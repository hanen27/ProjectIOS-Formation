//
//  AddView.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 17/11/2022.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView {
            VStack{
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 45 )
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
           
            
        }
        .navigationTitle("Add an Item ✏️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()

        }
    }
}
