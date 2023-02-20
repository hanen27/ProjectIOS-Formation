//
//  HomeView.swift
//  RecipeSvaer
//
//  Created by Hanen Abdelkrim on 25/11/2022.
//

import SwiftUI

struct HomeView: View {
   @EnvironmentObject var recipesVM: RecipeViewModel
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeList(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
    }
}
