//
//  BasketRecipeList.swift
//  Trolley
//
//  Created by Romain Choulet on 26/01/2021.
//

import SwiftUI

struct BasketRecipesList: View {
    @EnvironmentObject var appData: AppData
    
    @Binding var show_itSelf: Bool
    @Binding var basket: Basket
    
    var body: some View {
        NavigationView {
            List {
                ForEach(appData.list_recipes, id: \.self) { recipe in
                    Button(action: {
                        for i in 0..<recipe.list_ingredients.count {
                            appData.list_baskets[ appData.list_baskets.firstIndex(of: basket)!].list_ingredients.append(recipe.list_ingredients[i])
                           appData.saveListBaskets()
                            basket.list_ingredients.append(recipe.list_ingredients[i])
                            show_itSelf.toggle()
                        }
                    }) {
                        RecipesBookItemView(recipe)
                    }
                }
            }
            .padding()
            .navigationTitle("Import from a recipe")
            .navigationBarItems(trailing: Button(action: {
                show_itSelf.toggle()
            }) {
                Image(systemName: "multiply")
                    .imageScale(.large)
            })
        }
    }
}

//struct BasketRecipeList_Previews: PreviewProvider {
//    static var previews: some View {
//        BasketRecipeList()
//    }
//}
