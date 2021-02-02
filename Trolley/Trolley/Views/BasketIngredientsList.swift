//
//  BasketIngredientsList.swift
//  Trolley
//
//  Created by Romain Choulet on 26/01/2021.
//

import SwiftUI

struct BasketIngredientsList: View {
    @EnvironmentObject var appData: AppData
    
    @Binding var show_itSelf: Bool
    @Binding var basket: Basket
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(appData.list_ingredients, id: \.self) { ingredient in
                    Button(action: {
                        appData.list_baskets[ appData.list_baskets.firstIndex(of: basket)!].list_ingredients.append(ingredient)
                        appData.saveListBaskets()
                         basket.list_ingredients.append(ingredient)
                         show_itSelf.toggle()
                    }) {
                        IngredientView(ingredient)
                    }
                }
            }
            .padding()
            .navigationTitle("Add an ingredient")
            .navigationBarItems(trailing: Button(action: {
                show_itSelf.toggle()
            }) {
                Image(systemName: "multiply")
                    .imageScale(.large)
            })
        }
    }
}


//struct BasketIngredientsList_Previews: PreviewProvider {
//    static var previews: some View {
//        BasketIngredientsList()
//    }
//}
