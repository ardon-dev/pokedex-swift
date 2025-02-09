//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    private let getPokemonListUseCase: GetPokemonListUseCase
    
    @Published
    var searchText: String = ""
    
    @MainActor
    @Published
    var pokemons: [Pokemon]? = []
    
    @MainActor
    @Published
    var error: String? = nil
    
    init(getPokemonListUseCase: GetPokemonListUseCase) {
        self.getPokemonListUseCase = getPokemonListUseCase
    }
    
    func getPokemonList() async {
        if let result = await getPokemonListUseCase.execute() {
            await MainActor.run {
                pokemons = result.results
            }
        } else {
            await MainActor.run {
                error = error?.description
            }
           
        }
    }
    
}
