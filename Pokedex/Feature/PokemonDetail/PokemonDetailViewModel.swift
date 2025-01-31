//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Josue on 30/1/25.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    @MainActor
    @Published
    var pokemonDetail: PokemonDetailResponse? = nil
    
    @MainActor
    @Published
    var error: String? = nil
    
    func getPokemon(pokemonId: String) async {
        if let result = await PokemonRepository.getPokemon(pokemonId: pokemonId) {
            await MainActor.run {
                pokemonDetail = result
            }
        } else {
            await MainActor.run {
                error = "Error"
            }
           
        }
    }
    
}
