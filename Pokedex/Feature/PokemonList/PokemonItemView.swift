//
//  PokemonItemView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI

struct PokemonItemView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .border(.blue)
            VStack {
                Image("pokeball")
                    .resizable()
                    .frame(
                        width: 50,
                        height: 50
                    )
                Text("Name")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
            }
            .frame(
                maxWidth: .infinity
            )
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.white)
    }
}

#Preview {
    PokemonItemView()
}
