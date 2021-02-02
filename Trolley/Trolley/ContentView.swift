//
//  ContentView.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import SwiftUI

struct ContentView: View {
    // Environment object
    @EnvironmentObject var appData : AppData
    
    // Variables
    @State var index_tabSelected = 0
    
    
    var body: some View {
        
        TabView(selection: $index_tabSelected) {
            BasketListView().environmentObject(appData)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Baskets")
                    }
                }
                .tag(0)
            
            RecipesBookView().environmentObject(appData)
                .tabItem {
                    VStack {
                        Image(systemName: "book")
                        Text("Recipes Book")
                    }
                }
                .tag(1)
            
            IngredientsListDisplayView().environmentObject(appData)
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Ingredients List")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
