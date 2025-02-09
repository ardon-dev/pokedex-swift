//
//  PokemonLocalData.swift
//  Pokedex
//
//  Created by Josue on 1/2/25.
//

import Foundation
import SwiftData

@Model
class PokemonLocalData: Identifiable {
    var name: String
    var url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
