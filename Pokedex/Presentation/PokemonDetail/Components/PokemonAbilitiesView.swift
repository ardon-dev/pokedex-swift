//
//  PokemonAbilitiesView.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import SwiftUI

struct PokemonAbilitiesView: View {
    
    let abilities: [Ability]
    
    var body: some View {
        VStack {
            Text("Abilities")
                .font(.title.bold())
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.horizontal, 16)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(abilities) { ability in
                        Text(ability.ability.name.capitalized)
                            .font(.headline)
                            .padding()
                            .background(.blue)
                            .cornerRadius(16)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }
        .padding(.vertical, 16)
        .background(.white)
        .cornerRadius(16)
    }
    
}

#Preview {
    PokemonAbilitiesView(
        abilities: [
            Ability(ability: Species(name: "Example", url: ""), isHidden: false, slot: 1),
            Ability(ability: Species(name: "Example 2", url: ""), isHidden: false, slot: 1),
            Ability(ability: Species(name: "Example 3", url: ""), isHidden: false, slot: 1),
            Ability(ability: Species(name: "Example 4", url: ""), isHidden: false, slot: 1),
        ]
    )
}
