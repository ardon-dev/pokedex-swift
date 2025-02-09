//
//  Extensions.swift
//  Pokedex
//
//  Created by Josue on 9/2/25.
//

import Foundation

func parseData<T: Decodable>(data: Data) throws -> T {
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
