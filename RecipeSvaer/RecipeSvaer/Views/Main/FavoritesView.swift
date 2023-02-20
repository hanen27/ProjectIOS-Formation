//
//  FavoritesView.swift
//  RecipeSvaer
//
//  Created by Hanen Abdelkrim on 25/11/2022.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            Text("you haven't saved any recipe to your favorites yet ")
                .padding()
                .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
