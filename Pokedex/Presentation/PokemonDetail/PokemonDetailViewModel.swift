//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Josue on 30/1/25.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    private let getPokemonUseCase: GetPokemonUseCase
    
    init(getPokemonUseCase: GetPokemonUseCase) {
        self.getPokemonUseCase = getPokemonUseCase
    }
    
    @MainActor
    @Published
    var pokemonDetail: PokemonDetailResponse? = nil
    
    @MainActor
    @Published
    var error: String? = nil
    
    func getPokemon(name: String) async {
        if let result = await getPokemonUseCase.execute(name: name) {
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
