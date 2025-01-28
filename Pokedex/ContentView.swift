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
        NavigationStack {
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
            .background(.white)
            .navigationTitle("Pokemon")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbarBackground(.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
