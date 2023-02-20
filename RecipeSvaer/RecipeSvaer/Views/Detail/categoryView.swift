//
//  categoryView.swift
//  RecipeSvaer
//
//  Created by Hanen Abdelkrim on 28/11/2022.
//

import SwiftUI

struct categoryView: View {
    var category : Category
    var body: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all.filter{$0.category == category.rawValue})
        }
        .navigationTitle(category.rawValue + "s")
    }
}

struct categoryView_Previews: PreviewProvider {
    static var previews: some View {
        categoryView(category: Category.dessert)
    }
}
