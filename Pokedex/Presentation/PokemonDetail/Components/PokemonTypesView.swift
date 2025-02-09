//
//  PokemonTypesView.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import SwiftUI

struct PokemonTypesView: View {
    
    let types: [TypeElement]
    
    var body: some View {
        HStack {
            ForEach(
                Array(types.enumerated()),
                id: \.element.id
            ) { index, type in
                Label {
                    Text(type.type.name.capitalized).bold()
                } icon: {
                    let icon = type.getIcon()
                    Image(systemName: "\(icon)")
                        .foregroundColor(.blue)
                }
                .frame(
                    maxWidth: .infinity
                )
                if index == 0 {
                    Divider()
                }
            }
        }
        .frame(
            maxWidth: .infinity
        )
        .padding()
        .background(.white)
        .cornerRadius(16)
    }
    
}

#Preview {
    PokemonTypesView(
        types: [
            TypeElement(slot: 2, type: Species(name: "type", url: ""))
        ]
    )
}
