//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    @Published
    var pokemons: [Pokemon] = [
        Pokemon(name: "Bulbasaur", url: "http"),
        Pokemon(name: "Venusaur", url: "http")
    ]
    
}
