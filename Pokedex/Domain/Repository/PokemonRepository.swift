//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import Foundation

protocol PokemonRepository {
    
    func getAllPokemon() async -> PokemonResponse?
    
    func getPokemon(name: String) async -> PokemonDetailResponse?
    
}
