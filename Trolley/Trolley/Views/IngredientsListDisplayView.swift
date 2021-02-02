//
//  IngredientsView.swift
//  Trolley
//
//  Created by Romain Choulet on 24/01/2021.
//

import SwiftUI

struct IngredientsListDisplayView: View {
    @EnvironmentObject var appData: AppData
    
    @State var show_ingredientDetailView: Bool = false
    @State var show_addIngredientView: Bool = false
    @State var show_deleteIngredient: Bool = false
    
    @State var ing_forDetailView: Ingredient!
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(appData.list_ingredients, id: \.self) { ingredient in
                            HStack {
                                Button(action: {
                                    withAnimation {
                                        ing_forDetailView = ingredient
                                        show_ingredientDetailView = true
                                    }
                                }) {
                                    IngredientView(ingredient)
                                }
                                
                                if (show_deleteIngredient) {
                                    Button(action: {
                                        show_ingredientDetailView = false
                                        appData.list_ingredients.remove(at: appData.list_ingredients.firstIndex(of: ingredient)!)
                                        appData.saveListIngredients()
                                        appData.saveListIngredients()
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    .transition(.scale)
                                }
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
                            Text((show_deleteIngredient == true && appData.list_recipes != []) ? "Cancel" : "Delete")
                                .fontWeight((show_deleteIngredient == true && appData.list_recipes != []) ? .none : .bold)
                                .foregroundColor((show_deleteIngredient == true && appData.list_recipes != []) ? .blue : .red)
                             Spacer()
                        }
                    }
                    .padding()
                }
                
                if (show_ingredientDetailView && !show_addIngredientView) {
                    IngredientDetailView(ingredient: ing_forDetailView, show_itSelf: $show_ingredientDetailView)
                        .padding()
                        .padding()
                        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .transition(.scale)
                }
                
                if (show_addIngredientView) {
                    AddIngredientView(show_itSelf: $show_addIngredientView).environmentObject(appData)
                        .padding()
                        .padding()
                        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .transition(.scale)
                }
            }
            .navigationTitle("Ingredients List")
            .navigationBarItems(trailing: Button(action: {
                withAnimation {
                    show_addIngredientView.toggle()
                    show_ingredientDetailView = false
                }
            }) {
                Image(systemName: "plus")
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
