//
//  BasketListView.swift
//  Trolley
//
//  Created by Romain Choulet on 25/01/2021.
//

import SwiftUI

struct BasketListView: View {
    @EnvironmentObject var appData: AppData
    
    @State var show_deleteBasket: Bool = false
    @State var show_addBasketView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(appData.list_baskets, id: \.self) { basket in
                            HStack {
                                Spacer()
                                NavigationLink(destination: BasketDetailView(basket: basket).environmentObject(appData)) {
                                    BasketView(basket: basket)
                                        .foregroundColor(.black)
                                        .shadow(radius: 2)
                                }
                                
                                Spacer()
                                
                                if (show_deleteBasket) {
                                    Button(action: {
                                        appData.list_baskets.remove(at: appData.list_baskets.firstIndex(of: basket)!)
                                        appData.saveListBaskets()
                                        appData.saveListBaskets()
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                    .transition(.slideInSlideOut)
                                }
                            }
                            .padding()
                            
                        }
                        //Spacer()
                    }
                    
                    Button(action: {
                        withAnimation {
                            show_deleteBasket.toggle()
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text((show_deleteBasket == true && appData.list_baskets != []) ? "Cancel" : "Delete")
                                .fontWeight((show_deleteBasket == true && appData.list_baskets != []) ? .none : .bold)
                                .foregroundColor((show_deleteBasket == true && appData.list_baskets != []) ? .blue : .red)
                            Spacer()
                        }
                    }
                    .padding()
                }
                
                if (show_addBasketView) {
                    AddBasketView(show_addBasketView: $show_addBasketView).environmentObject(appData)
                        .padding()
                        .padding()
                        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        .transition(.scale)
                }
                
            }
            .navigationTitle("Baskets")
            .navigationBarItems(trailing: Button(action: {
                withAnimation {
                    show_addBasketView.toggle()
                }
            }) {
                Image(systemName: "plus")
                    .imageScale(.large)
            })
        }
    }
}

struct BasketListView_Previews: PreviewProvider {
    static var previews: some View {
        BasketListView().environmentObject(AppData())
    }
}
