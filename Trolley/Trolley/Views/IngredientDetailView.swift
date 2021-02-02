//
//  IngredientDetailView.swift
//  Trolley
//
//  Created by Romain Choulet on 24/01/2021.
//

import SwiftUI

struct IngredientDetailView: View {
    @State var ingredient: Ingredient
    @Binding var show_itSelf: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(" " + ingredient.name + " ")
                    .font(.signPainterTitle)
                Spacer()
                
                Button(action: {
                    show_itSelf.toggle()
                }) {
                    Image(systemName: "multiply")
                        .imageScale(.large)
                        .font(Font.headline.bold())
                }
                
            }
            
            Image(uiImage: UIImage(data: ingredient.data_img)!)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.size.width/2.15)
                //.padding()

        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

//struct IngredientDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientDetailView(ingredient: Ingredient(name: "Onion", data_img: UIImage(named: "oignon.jpg")!.pngData()!))
//    }
//}
