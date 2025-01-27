//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI

struct PokemonListView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1..<31) { index in
                    PokemonItemView()
                }
            }
            .padding()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .background(.white)
    }
}

#Preview {
    PokemonListView()
}
