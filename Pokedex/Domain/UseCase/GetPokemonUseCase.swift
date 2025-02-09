//
//  GetPokemonUseCase.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import Foundation

protocol GetPokemonUseCase {
    
    func execute(name: String) async -> PokemonDetailResponse?
    
}

class GetPokemonUseCaseImpl: GetPokemonUseCase {
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(name: String) async -> PokemonDetailResponse? {
        return await pokemonRepository.getPokemon(name: name)
    }
    
}
