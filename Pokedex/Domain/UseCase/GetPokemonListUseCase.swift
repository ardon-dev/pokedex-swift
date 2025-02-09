//
//  GetPokemonListUseCase.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import Foundation

protocol GetPokemonListUseCase {
    
    func execute() async -> PokemonResponse?
    
}

class GetPokemonListUseCaseImpl: GetPokemonListUseCase {
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute() async -> PokemonResponse? {
        return await pokemonRepository.getAllPokemon()
    }
    
}
