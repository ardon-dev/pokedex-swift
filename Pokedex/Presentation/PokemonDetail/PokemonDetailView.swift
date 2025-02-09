//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Josue on 28/1/25.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts
import SwiftData

struct PokemonDetailView: View {
    
    @ObservedObject
    private var viewModel: PokemonDetailViewModel
    
    init(viewModel: PokemonDetailViewModel, pokemonName: String, pokemonUrl: String) {
        self.viewModel = viewModel
        self.pokemonName = pokemonName
        self.pokemonUrl = pokemonUrl
    }
    
    @Environment(\.modelContext)
    private var context
    
    @Query()
    private var localPokemons: [PokemonLocalData]
    
    var pokemonName: String
    var pokemonUrl: String
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                // Graphic
                ZStack {
                    Ellipse()
                        .fill(.white)
                        .frame(
                            width: 250,
                            height: 150
                        )
                        .rotationEffect(Angle(degrees: 30))
                    WebImage(
                        url: URL(
                            string: viewModel.pokemonDetail?
                                .getSpriteUrl() ?? ""
                        ),
                        content: { image in
                            image
                        },
                        placeholder: { ProgressView() }
                    )
                    .resizable()
                    .frame(
                        width: 200,
                        height: 200
                    )
                }
                .frame(
                    height: 200
                )
                
                // Types
                if let types = viewModel.pokemonDetail?.types {
                    PokemonTypesView(types: types)
                }
                
                Spacer(minLength: 16)
                
                // Weight & Height
                if let detail = viewModel.pokemonDetail {
                    PokemonPropertiesView(
                        height: detail.getFormattedHeight(),
                        weight: detail.getFormattedWeight()
                    )
                }
                
                Spacer(minLength: 16)
                
                // Stats
                if let stats = viewModel.pokemonDetail?.stats {
                    PokemonStatsView(stats: stats)
                }
                
                Spacer(minLength: 16)
                
                // Abilities'
                if let abilities = viewModel.pokemonDetail?.abilities {
                    PokemonAbilitiesView(abilities: abilities)
                }
                
            }
            .padding()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(.appBackground)
        .onAppear {
            Task {
                await viewModel.getPokemon(name: pokemonName)
            }
        }
        .navigationTitle(pokemonName.capitalized)
        .toolbar {
            ToolbarItemGroup {
                if let localPokemon = localPokemons.first(where: { $0.name == pokemonName}) {
                    Button("", systemImage: "heart.fill") {
                        context.delete(localPokemon)
                    }
                } else {
                    Button("", systemImage: "heart") {
                        context.insert(
                            PokemonLocalData(
                                name: pokemonName,
                                url: pokemonUrl
                            )
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonDetailView(
        viewModel: PokedexApp().pokemonDetailViewModel,
        pokemonName: "bulbasaur",
        pokemonUrl: "https://pokeapi.co/api/v2/pokemon/bulbasaur"
    )
}
