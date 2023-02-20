//
//  TypeAlias.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 24/11/2022.
//

import SwiftUI
struct MovieModel {
    let title: String
    let director: String
    let count: Int
}
struct TypeAlias: View {
    @State var item: MovieModel = MovieModel(title: "Title", director: "joe", count: 5)
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypeAlias_Previews: PreviewProvider {
    static var previews: some View {
        TypeAlias()
    }
}
