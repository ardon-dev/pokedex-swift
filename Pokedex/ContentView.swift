//
//  ContentView.swift
//  Pokedex
//
//  Created by Josue on 26/1/25.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        VStack {
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
    }
}

#Preview {
    ContentView()
}
