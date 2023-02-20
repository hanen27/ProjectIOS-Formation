//
//  NewRecipeView.swift
//  RecipeSvaer
//
//  Created by Hanen Abdelkrim on 25/11/2022.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    var body: some View {
        NavigationView {
            Button("Add recipe manually") {
                showAddRecipe = true
            }
            .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            AddRecipeView()
        }

    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
