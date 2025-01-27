//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI

struct PokemonListView: View {
    var body: some View {
        List {
            ForEach(1..<11) { index in
                Text("\(index)")
            }
        }
        .listStyle(.plain)
        .background(.white)
    }
}

#Preview {
    PokemonListView()
}
