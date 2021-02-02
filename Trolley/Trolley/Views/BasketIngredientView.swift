//
//  BasketIngredientView.swift
//  Trolley
//
//  Created by Romain Choulet on 26/01/2021.
//

import SwiftUI

struct BasketIngredientView: View {
    @State var ingredient: Ingredient
    
    @State var show_divider: Bool = false
    
    var body: some View {
        Button(action: {
            show_divider.toggle()
        }) {
            ZStack {
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
                .padding(.leading)
                
                if (show_divider) {
                    VStack {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                }
            }
        }
    }
    
}

struct BasketIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        BasketIngredientView(ingredient: list_defaultIngredients[0])
    }
}
