//
//  FavoriteListView.swift
//  Pokedex
//
//  Created by Josue on 4/2/25.
//

import SwiftUI
import SwiftData

struct FavoriteListView: View {
    
    @Environment(\.modelContext)
    private var context
    
    @Query
    private var localPokemons: [PokemonLocalData]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            
            if localPokemons.isEmpty {
                Text("No tienes favoritos.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(localPokemons) { pokemon in
                            NavigationLink(
                                destination: {
                                    PokemonDetailView(
                                        viewModel: PokedexApp().pokemonDetailViewModel,
                                        pokemonName: pokemon.name,
                                        pokemonUrl: pokemon.url
                                    )
                                }
                            ) {
                                PokemonItemView(pokemon: Pokemon(name: pokemon.name, url: pokemon.url))
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
                .navigationTitle("Favoritos")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    
}

#Preview {
    FavoriteListView()
        .modelContainer(for: PokemonLocalData.self, inMemory: true)
}
