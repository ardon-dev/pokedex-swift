//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    @Published
    var searchText: String = ""
    
    @MainActor
    @Published
    var pokemons: [Pokemon]? = []
    
    @MainActor
    @Published
    var error: String? = nil
    
    func getPokemonList() async {
        if let result = await PokemonRepository.getPokemonList() {
            await MainActor.run {
                pokemons = result.results
            }
        } else {
            await MainActor.run {
                error = "Error"
            }
           
        }
    }
    
}
