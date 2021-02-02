//
//  AddBasketView.swift
//  Trolley
//
//  Created by Romain Choulet on 28/01/2021.
//

import SwiftUI

struct AddBasketView: View {
    /// ENVIRONMENT OBJECT
    @EnvironmentObject var appData: AppData
    
    /// PARAMETERS
    @Binding var show_addBasketView: Bool
    
    /// VARIABLES
    @State var basket_name: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("New basket")
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                Spacer()
                TextField("Basket Name...", text: $basket_name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.frame(width: 300)
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    show_addBasketView = false
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    if (basket_name != "") {
                        appData.list_baskets.append(
                            Basket(name: self.basket_name, list_ingredients: [])
                        )
                        appData.saveListBaskets()
                        show_addBasketView = false
                    }
                }) {
                    HStack {
                        //Spacer()
                        Text("Add")
                            .fontWeight(.bold)
                        //Spacer()
                    }
                    
                }
                
                Spacer()
            }
            .padding(.top)
           
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

