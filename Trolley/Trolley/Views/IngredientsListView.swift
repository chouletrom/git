//
//  IngredientsView.swift
//  Trolley
//
//  Created by Romain Choulet on 24/01/2021.
//

import SwiftUI

struct IngredientsListView: View {
    @EnvironmentObject var appData: AppData
    
    @Binding var recipe: Recipe
    @Binding var show_itSelf: Bool
    
    var body: some View {
        NavigationView {
            List {
                ForEach(appData.list_ingredients, id: \.self) { ingredient in
                    Button(action: {
                        appData.list_recipes[appData.list_recipes.firstIndex(of: recipe)!].list_ingredients.append(ingredient)
                        appData.saveListRecipes()
                        recipe.list_ingredients.append(ingredient)
                        show_itSelf.toggle()
                    }) {
                        IngredientView(ingredient)
                    }
                }
            }
            .padding()
            .navigationTitle("Ingredients List")
            .navigationBarItems(trailing: Button(action: {
                show_itSelf.toggle()
            }) {
                Image(systemName: "multiply")
                    .imageScale(.large)
            })
        }
    }
}

//struct IngredientsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientsListView(recipe: Recipe(name: "test", data_img: UIImage(named: "tomato.jpg")!.pngData()!, list_ingredients: [])).environmentObject(AppData())
//    }
//}
