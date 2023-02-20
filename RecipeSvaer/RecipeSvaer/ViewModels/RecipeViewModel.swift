//
//  RecipeViewModel.swift
//  RecipeSvaer
//
//  Created by Hanen Abdelkrim on 29/11/2022.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    init() {
        recipes = Recipe.all 
    }
}
