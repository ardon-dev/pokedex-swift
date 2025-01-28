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
    
    func getSprite() -> String {
        if let url = URL(string: self.url) {
            let path = url.path
            let components = path.split(separator: "/")
            if let lastComponent = components.last, let number = Int(lastComponent) {
                return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(number).png"
            } else {
                return ""
            }
        } else {
            return ""
        }
        
    }
    
}
