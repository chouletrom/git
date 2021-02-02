//
//  BasketRowView.swift
//  Trolley
//
//  Created by Romain Choulet on 25/01/2021.
//
import Foundation
import SwiftUI

struct BasketRowView: View {
    @EnvironmentObject var appData: AppData
    
    var list_baskets: [Basket]
    
    var body: some View {
        HStack {
            ForEach(0..<list_baskets.count) { i in
                NavigationLink(destination: Text("oui")) {
                    BasketView(basket: self.list_baskets[i])
                }
            }
        }
    }
}

struct BasketRowView_Previews: PreviewProvider {
    static var previews: some View {
        BasketRowView(list_baskets: list_defaultBasket).environmentObject(AppData())
    }
}
