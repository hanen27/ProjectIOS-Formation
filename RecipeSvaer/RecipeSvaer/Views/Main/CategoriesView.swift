//
//  CategoriesView.swift
//  RecipeSvaer
//
//  Created by Hanen Abdelkrim on 25/11/2022.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases, id: \.self) { category in
                    NavigationLink {
                        categoryView(category: category)
                      
                    } label: {
                        Text(category.rawValue + "s" )

                    }
                    
                }
            }
                .navigationTitle("Catgories")
        }
        .navigationViewStyle(.stack)

    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
