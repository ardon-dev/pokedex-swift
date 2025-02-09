//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation
import Alamofire

class PokemonRepositoryImpl: PokemonRepository {
    
    private let pokemonService: PokemonService
    
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }
    
    func getAllPokemon() async -> PokemonResponse? {
        return await pokemonService.getAllPokemon()
    }
    
    func getPokemon(name: String) async -> PokemonDetailResponse? {
        return await pokemonService.getPokemon(name: name)
    }
    
}
