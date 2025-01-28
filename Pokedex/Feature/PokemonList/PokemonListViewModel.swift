//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    @Published
    var pokemons: [Pokemon]? = []
    
    @Published
    var error: String? = nil
    
    func getPokemonList() async {
        if let result = await PokemonRepository.getPokemonList() {
            pokemons = result.results
        } else {
            error = "Error"
        }
    }
    
}
