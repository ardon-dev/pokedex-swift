//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI
import SwiftData

@main
struct PokedexApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [PokemonLocalData.self])
        }
    }
    
    // MARK: Viewmodel dependencies
    
    let pokemonListViewModel = PokemonListViewModel(
        getPokemonListUseCase: GetPokemonListUseCaseImpl(
            pokemonRepository: PokemonRepositoryImpl(
                pokemonService: PokemonService(
                    networkService: NetworkService.shared
                )
            )
        )
    )
    
    let pokemonDetailViewModel = PokemonDetailViewModel(
        getPokemonUseCase: GetPokemonUseCaseImpl(
            pokemonRepository: PokemonRepositoryImpl(
                pokemonService: PokemonService(
                    networkService: NetworkService.shared
                )
            )
        )
    )
    
}
