//
//  PokemonPropertiesView.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import SwiftUI

struct PokemonPropertiesView: View {

    let height: String
    let weight: String
    
    var body: some View {
        HStack {
            Label {
                Text("\(weight) Kg").bold()
            } icon: {
                Image(systemName: "scalemass")
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity)
            .padding(.trailing, 8)
            Divider()
            Label {
                Text("\(height) m").bold()
            } icon: {
                Image(systemName: "ruler")
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 8)
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
    PokemonPropertiesView(
        height: "", weight: ""
    )
}
