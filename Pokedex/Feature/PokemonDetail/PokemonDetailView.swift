//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Josue on 28/1/25.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct PokemonDetailView: View {
    
    var pokemonId: String
    
    @ObservedObject
    private var viewModel: PokemonDetailViewModel = PokemonDetailViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                // Graphic
                ZStack {
                    Ellipse()
                        .fill(.white)
                        .frame(
                            width: 250,
                            height: 150
                        )
                        .rotationEffect(Angle(degrees: 30))
                    WebImage(
                        url: URL(
                            string: viewModel.pokemonDetail?
                                .getSpriteUrl() ?? ""
                        ),
                        content: { image in
                            image
                        },
                        placeholder: { ProgressView() }
                    )
                    .resizable()
                    .frame(
                        width: 200,
                        height: 200
                    )
                }
                .frame(
                    height: 200
                )
                
                // Types
                PokemonDetailTypesView(
                    types: viewModel.pokemonDetail?.types ?? []
                )
                
                Spacer(minLength: 16)
                
                // Weight & Height
                if let detail = viewModel.pokemonDetail {
                    PokemonDetailPropertiesView(pokemonDetail: detail)
                }
                
                Spacer(minLength: 16)
                
                // Stats
                if let stats = viewModel.pokemonDetail?.stats {
                    PokemonDetailStatsView(stats: stats)
                }
                
                Spacer(minLength: 16)
                
                // Abilities'
                if let abilities = viewModel.pokemonDetail?.abilities {
                    PokemonDetaiAbilitiesView(abilities: abilities)
                }
                
            }
            .padding()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(.appBackground)
        .onAppear {
            Task {
                await viewModel.getPokemon(pokemonId: pokemonId)
            }
        }
        .navigationTitle(pokemonId.capitalized)
    }
}

struct PokemonDetailTypesView: View {
    
    var types: [TypeElement]
    
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

struct PokemonDetailPropertiesView: View {
    
    var pokemonDetail: PokemonDetailResponse
    
    var body: some View {
        HStack {
            Label {
                let weight: String = pokemonDetail.getFormattedWeight()
                Text("\(weight) Kg").bold()
            } icon: {
                Image(systemName: "scalemass")
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity)
            .padding(.trailing, 8)
            Divider()
            Label {
                let height: String = pokemonDetail.getFormattedHeight()
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

struct PokemonDetailStatsView: View {
    
    let stats: [Stat]
    
    var body: some View {
        VStack {
            Text("Stats")
                .font(.title.bold())
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            Chart(stats) { stat in
               
                BarMark(
                    x: .value("Stat", stat.stat.name.capitalized),
                    y: .value("Value", stat.baseStat)
                )
                .foregroundStyle(by: .value("Stat", stat.stat.name))
                .annotation(
                    position: .top
                ) { // Mostrar el valor encima de cada barra
                    Text("\(stat.baseStat)")
                        .font(.caption)
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .chartLegend(.hidden)
            .frame(height: 200)
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
    }
}

struct PokemonDetaiAbilitiesView: View {
    
    let abilities: [Ability]
    
    var body: some View {
        VStack {
            Text("Abilities")
                .font(.title.bold())
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
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
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
    }
}

#Preview {
    PokemonDetailView(pokemonId: "bulbasaur")
}
