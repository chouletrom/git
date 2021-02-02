//
//  RecipeView.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import SwiftUI

struct RecipeView: View {
    /// ENVIRONMENT OBJECT
    @EnvironmentObject var appData : AppData
    
    /// PARAMETERS
    @State var recipe: Recipe
    
    /// VARIABLES
    @State var show_addIngredientView: Bool = false
    @State var show_ingredientsListView: Bool = false
    @State var show_ingredientDetailView: Bool = false
    
    @State var ing_forDetailView: Ingredient!
    
    var body: some View {
        ZStack {
            VStack {
                Image(uiImage: UIImage(data: recipe.data_img)!)
                    .resizable(capInsets: EdgeInsets(), resizingMode: .tile)
                    .frame(height: UIScreen.main.bounds.size.width/2.15)
                
                HStack {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .font(Font.headline.bold())
                        .opacity(0)
                    Spacer()
                    Text(" " + recipe.name + " ")
                        .font(Font.signPainterTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        show_ingredientsListView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .font(Font.headline.bold())
                    }
                }
                .padding()
                
                List {
                    ForEach(recipe.list_ingredients, id:\.self) { ingredient in
                        Button(action: {
                            withAnimation {
                                ing_forDetailView = ingredient
                                show_ingredientDetailView = true
                            }
                        }) {
                            IngredientView(ingredient)
                        }
                    }
                }
                .cornerRadius(15)
                .padding()

                
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
            .background(Color(UIImage(data: recipe.data_img)!.averageColor!))
            .sheet(isPresented: $show_ingredientsListView) {
                IngredientsListView(recipe: $recipe, show_itSelf: $show_ingredientsListView).environmentObject(appData)
            }
            
            if (show_ingredientDetailView) {
                IngredientDetailView(ingredient: ing_forDetailView, show_itSelf: $show_ingredientDetailView)
                    .padding()
                    .padding()
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .transition(.scale)
            }
        }
    }
}

//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        let r = Recipe(
//            name: "TomatoRecipe",
//            data_img: UIImage(named: "tomato.jpg")!.pngData()!,
//            list_ingredients: [Ingredient(name: "Tomato", data_img: UIImage(named: "tomato.jpg")!.pngData()!), Ingredient(name: "Other tomato", data_img: UIImage(named: "tomato.jpg")!.pngData()!)])
//        RecipeView(r)
//    }
//}
