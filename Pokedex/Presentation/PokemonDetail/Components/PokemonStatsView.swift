//
//  PokemonStatsView.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import SwiftUI
import Charts

struct PokemonStatsView: View {
    
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
                ) {
                    // Mostrar el valor encima de cada barra
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

#Preview {
    PokemonStatsView(
        stats: [
            Stat(baseStat: 1, effort: 0, stat: Species(name: "stat 1", url: "")),
            Stat(baseStat: 2, effort: 0, stat: Species(name: "stat 2", url: "")),
            Stat(baseStat: 3, effort: 0, stat: Species(name: "stat 3", url: "")),
            Stat(baseStat: 4, effort: 0, stat: Species(name: "stat 4", url: "")),
        ]
    )
}
