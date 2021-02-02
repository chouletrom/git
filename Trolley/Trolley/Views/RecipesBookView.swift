//
//  RecipesBookView.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import SwiftUI

struct RecipesBookView: View {
    /// ENVIRONMENT OBJECT
    @EnvironmentObject var appData: AppData
    
    /// VARIABLES
    @State var show_addRecipeView: Bool = false
    @State var show_deleteRecipe = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                VStack {
                    List {
                        ForEach(appData.list_recipes, id:\.self) { recipe in
                            HStack {
                                if (!show_addRecipeView) {
                                    NavigationLink(destination: RecipeView(recipe: recipe).environmentObject(appData)) {
                                        RecipesBookItemView(recipe)
                                    }
                                } else {
                                    RecipesBookItemView(recipe)
                                }
                                
                                if(show_deleteRecipe) {
                                    Button(action: {
                                        appData.list_recipes.remove(at: appData.list_recipes.firstIndex(of: recipe)!)
                                        appData.saveListRecipes()
                                        appData.saveListRecipes()
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    .transition(.slideInSlideOut)
                                }
                            }
                        }
                    }
                    
                    Button(action: {
                        withAnimation {
                            show_deleteRecipe.toggle()
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text((show_deleteRecipe == true && appData.list_recipes != []) ? "Cancel" : "Delete")
                                .fontWeight((show_deleteRecipe == true && appData.list_recipes != []) ? .none : .bold)
                                .foregroundColor((show_deleteRecipe == true && appData.list_recipes != []) ? .blue : .red)
                             Spacer()
                        }
                    }
                    .padding()
                }
                
                if(show_addRecipeView) {
                    AddRecipeView(show_addRecipeView: $show_addRecipeView)
                        .padding()
                        .padding()
                        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        //.padding(.bottom, 200)
                        .transition(.scale)
                }
            }
            .navigationTitle("Recipes Book")
            .navigationBarItems(trailing:
                Button(action: {
                    withAnimation {
                        if (show_addRecipeView==false) {show_addRecipeView.toggle()}
                    }
                }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            )
        }
    }
}

struct RecipesBookView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesBookView().environmentObject(AppData())
    }
}

