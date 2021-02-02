//
//  Basket.swift
//  Trolley
//
//  Created by Romain Choulet on 25/01/2021.
//

import Foundation
import SwiftUI

struct Basket: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var list_ingredients: [Ingredient]
}
