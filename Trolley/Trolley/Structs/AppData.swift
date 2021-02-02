//
//  UserData.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import Foundation
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import CoreGraphics
import Accelerate
import CoreML


class AppData: ObservableObject {
    /// PARAMETERS
    @Published var list_recipes: [Recipe]
    @Published var list_ingredients: [Ingredient]
    @Published var list_baskets: [Basket]
    
    /// INIT
    init() {
        UserDefaults.standard.synchronize()
        if let data = UserDefaults.standard.data(forKey: "list_recipes") {
            if let decoded = try? JSONDecoder().decode([Recipe].self, from: data) {
                self.list_recipes = decoded
            } else {
                self.list_recipes = list_defaultRecipes
            }
        } else {
            self.list_recipes = list_defaultRecipes
        }
        
        if let data = UserDefaults.standard.data(forKey: "list_ingredients") {
            if let decoded = try? JSONDecoder().decode([Ingredient].self, from: data) {
                self.list_ingredients = decoded
            } else {
                self.list_ingredients = list_defaultIngredients
            }
        } else {
            self.list_ingredients = list_defaultIngredients
        }
        
        if let data = UserDefaults.standard.data(forKey: "list_baskets") {
            if let decoded = try? JSONDecoder().decode([Basket].self, from: data) {
                self.list_baskets = decoded
            } else {
                self.list_baskets = list_defaultBasket
            }
        } else {
            self.list_baskets = list_defaultBasket
        }
    }
    
    // Save recipes
    func saveListRecipes() {
        DispatchQueue.global().async {
            if let encoded = try? JSONEncoder().encode(self.list_recipes) {
                UserDefaults.standard.set(encoded, forKey: "list_recipes")
            }
        }
        
        UserDefaults.standard.synchronize()
    }
    
    // Save ingredients
    func saveListIngredients() {
        DispatchQueue.global().async {
            if let encoded = try? JSONEncoder().encode(self.list_ingredients) {
                UserDefaults.standard.set(encoded, forKey: "list_ingredients")
            }
        }
        
        UserDefaults.standard.synchronize()
    }
    
    // Save baskets
    func saveListBaskets() {
        DispatchQueue.global().async {
            if let encoded = try? JSONEncoder().encode(self.list_baskets) {
                UserDefaults.standard.set(encoded, forKey: "list_baskets")
            }
        }
        
        UserDefaults.standard.synchronize()
    }
}
