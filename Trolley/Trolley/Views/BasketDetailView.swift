//
//  BasketDetailView.swift
//  Trolley
//
//  Created by Romain Choulet on 26/01/2021.
//

import SwiftUI

struct BasketDetailView: View {
    @EnvironmentObject var appData: AppData
    
    @State var basket: Basket
    
    
    @State var show_underline: Bool = false
    @State var show_importFromRecipes: Bool = false
    @State var show_addIngredient: Bool = false
    @State var show_deleteIngredient: Bool = false
    
    var body: some View {
        VStack {
            List {
                ForEach(basket.list_ingredients, id: \.self) { ingredient in
                    HStack {
                        Button(action: {
                            //basket.list_ingredients.remove(at: basket.list_ingredients.firstIndex(of: ingredient)!)
                        }) {
                            IngredientView(ingredient)
                        }
                        
//                        if (show_deleteIngredient) {
//                            Button(action: {
//                            
//                            }) {
//                                Image(systemName: "trash")
//                                    .foregroundColor(.red)
//                                    .padding()
//                            }
//                            .transition(.slideInSlideOut)
//                        }
                    }
                }
            }
            
            Button(action: {
                withAnimation {
                    show_deleteIngredient.toggle()
                }
            }) {
                HStack {
                    Spacer()
                    Text((show_deleteIngredient == true && basket.list_ingredients != []) ? "Cancel" : "Delete")
                        .fontWeight((show_deleteIngredient == true && basket.list_ingredients != []) ? .none : .bold)
                        .foregroundColor((show_deleteIngredient == true && basket.list_ingredients != []) ? .blue : .red)
                    Spacer()
                }
            }
            .padding()
        }
        .navigationTitle(basket.name)
        .navigationBarItems(
            trailing:
                HStack(spacing: UIScreen.main.bounds.size.width/15) {
                    Button(action: {
                        show_addIngredient.toggle()
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    .sheet(isPresented: $show_addIngredient) {
                        BasketIngredientsList(show_itSelf: $show_addIngredient, basket: $basket).environmentObject(appData)
                    }
                    
                    Button(action: {
                        show_importFromRecipes.toggle()
                    }) {
                        Image(systemName: "square.and.arrow.down")
                            .imageScale(.large)
                    }
                    .sheet(isPresented: $show_importFromRecipes) {
                        BasketRecipesList(show_itSelf: $show_importFromRecipes, basket: $basket).environmentObject(appData)
                    }
                }
        )
    }
}

struct BasketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BasketDetailView(basket: list_defaultBasket[0]).environmentObject(AppData())
    }
}
