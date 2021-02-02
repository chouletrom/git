//
//  BasketView.swift
//  Trolley
//
//  Created by Romain Choulet on 24/01/2021.
//

import SwiftUI

struct BasketView: View {
    /// ENVIRONMENT OBJECT
    //@EnvironmentObject var appData: AppData
    
    @State var basket: Basket
    
    var body: some View {
        HStack {
            Image(systemName: "cart")
                .font(Font.title.bold())
            Text(basket.name)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        .padding(.leading)
        .frame(width: 4*(UIScreen.main.bounds.size.width)/7)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(15)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(basket: Basket(name: "Test", list_ingredients: []))
    }
}
