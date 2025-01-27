//
//  ContentView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            
            // Tab view
            ZStack {
                TabView {
                    Tab("Home", systemImage: "house") {
                        PokemonListView()
                    }
                    Tab("Favoritos", systemImage: "heart") {
                        EmptyView()
                    }
                }
            }
            
        }
        .background(.white)
    }
}

#Preview {
    ContentView()
}
