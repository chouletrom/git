//
//  RecipesBookItemView.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import SwiftUI

struct RecipesBookItemView: View {
    var recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: recipe.data_img)!.resized(to: CGSize(width: 50, height: 50)))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                //.overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 1)

                .frame(width: 50)
                .padding()
            
            Text(" " + recipe.name + " ")
                .font(.signPainter)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
    }
}

struct RecipesBookItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesBookItemView(list_defaultRecipes[0])
    }
}
