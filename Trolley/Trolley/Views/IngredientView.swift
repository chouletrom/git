//
//  IngredientView.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import SwiftUI

struct IngredientView: View {
    var ingredient: Ingredient
    
    init(_ ingredient: Ingredient) {
        self.ingredient = ingredient
    }
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: ingredient.data_img)!.resized(to: CGSize(width: 50, height: 50)))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .shadow(radius: 1)
                .frame(width: 50)
                .padding()
            
            Text(" " + ingredient.name + " ")
                .font(.signPainter)
                .padding()
            
            Spacer()
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(Ingredient(name: "Tomato", data_img: UIImage(named: "tomato.jpg")!.pngData()!))
    }
}
