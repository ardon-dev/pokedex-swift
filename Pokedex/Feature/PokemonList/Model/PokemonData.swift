//
//  PokemonData.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation

struct Pokemon: Identifiable {
    var id = UUID()
    var name: String?
    var url: String?
    
    init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }
    
    func getSprite(index: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(index).png"
    }
    
}
