//
//  Data.swift
//  Trolley
//
//  Created by Romain Choulet on 23/01/2021.
//

import Foundation
import SwiftUI

let list_defaultRecipes = [Recipe(
    name: "Spaghettis Bolognese",
    data_img: UIImage(named: "spaghettibolo.jpg")!.pngData()!,
    list_ingredients: [Ingredient(name: "Spaghettis", data_img: UIImage(named: "spaghetti.jpg")!.pngData()!), Ingredient(name: "Tomato", data_img: UIImage(named: "tomato.jpg")!.pngData()!), Ingredient(name: "Onion", data_img: UIImage(named: "oignon.jpg")!.pngData()!), Ingredient(name: "Meat", data_img: UIImage(named: "steak.jpg")!.pngData()!)])]

let list_defaultIngredients = [Ingredient(name: "Spaghettis", data_img: UIImage(named: "spaghetti.jpg")!.pngData()!), Ingredient(name: "Tomato", data_img: UIImage(named: "tomato.jpg")!.pngData()!), Ingredient(name: "Onion", data_img: UIImage(named: "oignon.jpg")!.pngData()!), Ingredient(name: "Meat", data_img: UIImage(named: "steak.jpg")!.pngData()!)]

let list_defaultBasket = [Basket(name: "Example", list_ingredients: [Ingredient(name: "Spaghettis", data_img: UIImage(named: "spaghetti.jpg")!.pngData()!), Ingredient(name: "Tomato", data_img: UIImage(named: "tomato.jpg")!.pngData()!), Ingredient(name: "Onion", data_img: UIImage(named: "oignon.jpg")!.pngData()!), Ingredient(name: "Meat", data_img: UIImage(named: "steak.jpg")!.pngData()!)])]
