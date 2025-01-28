//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation
import Alamofire

class PokemonRepository {
    
    public static let shared = PokemonRepository()
    
    static func getPokemonList() async -> PokemonResponse? {
        do {
            let parameters = [
                "offset": "0",
                "limit": "1500"
            ]
            let data = try await NetworkManager.shared.get(
                endpoint: "pokemon",
                parameters: parameters
            )
            print(data)
            let result: PokemonResponse? = try self.parseData(data: data)
            return result
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private static func parseData<T: Decodable>(data: Data) throws -> T{
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data)
        else {
            throw NSError(
                domain: "NetworkAPIError",
                code: 3,
                userInfo: [NSLocalizedDescriptionKey: "JSON decode error"]
            )
        }
        return decodedData
    }
    
}
