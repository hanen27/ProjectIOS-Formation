//
//  HashableBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 22/11/2022.
//

import SwiftUI
struct MyCustomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}
struct HashableBootcamp: View {
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title:  "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE")
 ]
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data) {
                    item in
                    Text(item.id)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
