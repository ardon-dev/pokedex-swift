//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject
    private var viewModel = PokemonListViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.pokemons) { pokemon in
                    PokemonItemView(pokemon: pokemon)
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
    }
}

#Preview {
    PokemonListView()
}
