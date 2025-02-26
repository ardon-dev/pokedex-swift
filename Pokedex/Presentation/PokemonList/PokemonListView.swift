//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject
    private var viewModel: PokemonListViewModel
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }
        
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    let filteredPokemon = if viewModel.searchText.isEmpty {
                        viewModel.pokemons
                    } else {
                        viewModel.pokemons?.filter {
                            $0.name.localizedCaseInsensitiveContains(viewModel.searchText)
                        }
                    }
                    
                    ForEach(filteredPokemon ?? []) { pokemon in
                        NavigationLink(
                            destination: {
                                PokemonDetailView(
                                    viewModel: PokedexApp().pokemonDetailViewModel,
                                    pokemonName: pokemon.name,
                                    pokemonUrl: pokemon.url
                                )
                            }
                        ) {
                            PokemonItemView(pokemon: pokemon)
                        }
                    }
                }
                .padding()
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .background(.appBackground)
            .onAppear {
                Task {
                    await viewModel.getPokemonList()
                }
            }
            .navigationTitle("Pokemon")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: Text("Buscar pokemon")
            )
        }
    }
}

#Preview {
    PokemonListView(
        viewModel: PokedexApp().pokemonListViewModel
    )
}
