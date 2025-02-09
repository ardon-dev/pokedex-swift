//
//  PokemonService.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import Foundation

class PokemonService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getAllPokemon() async -> PokemonResponse? {
        do {
            let parameters = [
                "offset": "0",
                "limit": "1500"
            ]
            let data = try await networkService.get(
                endpoint: "https://pokeapi.co/api/v2/pokemon",
                parameters: parameters
            )
            let result: PokemonResponse? = try parseData(data: data)
            return result
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getPokemon(name: String) async -> PokemonDetailResponse? {
        do {
            let data = try await networkService.get(
                endpoint: "https://pokeapi.co/api/v2/pokemon/\(name)",
                parameters: nil
            )
            let result: PokemonDetailResponse? = try parseData(data: data)
            return result
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
