//
//  PokemonItemView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonItemView: View {
    
    var pokemon: Pokemon? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
            VStack {
                WebImage(
                    url: URL(string: pokemon?.getSprite() ?? ""),
                    content: { image in
                        image
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .resizable()
                .frame(
                    width: 50,
                    height: 50
                )
                Text((pokemon?.name ?? "").capitalized)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 8)
            }
            .frame(
                maxWidth: .infinity
            )
            .padding()
        }
        .aspectRatio(1.0, contentMode: .fit)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.white)
    }
}

#Preview {
    PokemonItemView(
        pokemon: Pokemon(
            name: "Venusaur",
            url: "https://pokeapi.co/api/v2/pokemon/1/"
        )
    )
}
