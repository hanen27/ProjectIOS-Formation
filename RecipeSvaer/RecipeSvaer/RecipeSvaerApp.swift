//
//  RecipeSvaerApp.swift
//  RecipeSvaer
//
//  Created by Hanen Abdelkrim on 25/11/2022.
//

import SwiftUI

@main
struct RecipeSvaerApp: App {
    @StateObject var recipesViewModel = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
