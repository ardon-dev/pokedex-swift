//
//  PokemonData.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation

struct PokemonResponse: Codable {
    var results: [Pokemon]? = nil
}

struct Pokemon: Identifiable, Codable {
    var id = UUID()
    var name: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    func getSprite(index: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(index).png"
    }
    
}
