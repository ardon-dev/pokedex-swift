//
//  PokemonData.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation

struct PokemonResponse: Codable {
    var results: [Pokemon]? = nil
}

struct PokemonDetailResponse: Codable {
    var abilities: [Ability]
    var id: Int
    var types: [TypeElement]
    var weight: Int
    var height: Int
    var stats: [Stat]
    
    private enum CodingKeys: String, CodingKey {
        case abilities, id, types, weight, height, stats
    }
    
    init(
        abilities: [Ability],
        id: Int,
        types: [TypeElement],
        weight: Int,
        height: Int,
        stats: [Stat]
    ) {
        self.abilities = abilities
        self.id = id
        self.types = types
        self.weight = weight
        self.height = height
        self.stats = stats
    }
    
    func getSpriteUrl() -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(self.id).png"
    }
    
    func getFormattedWeight() -> String {
        let weightInKilograms = ((Double(self.weight)) * 0.1)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
            .string(from: NSNumber(value: weightInKilograms)) ?? "N/A"
    }
    
    func getFormattedHeight() -> String {
        let heightInMeters = ((Double(self.height)) * 0.1)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
            .string(from: NSNumber(value: heightInMeters)) ?? "N/A"
    }
}

struct Pokemon: Identifiable, Codable {
    var id = UUID()
    var name: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    func getSpriteUrl() -> String {
        if let url = URL(string: self.url) {
            let path = url.path
            let components = path.split(separator: "/")
            if let lastComponent = components.last, let number = Int(
                lastComponent
            ) {
                return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(number).png"
            } else {
                return ""
            }
        } else {
            return ""
        }
        
    }
    
}

// MARK: Ability

struct Ability: Codable, Identifiable {
    var id = UUID()
    var ability: Species
    var isHidden: Bool
    var slot: Int
    
    private enum CodingKeys: String, CodingKey {
        case ability, slot
        case isHidden = "is_hidden"
    }
    
    init(id: UUID = UUID(), ability: Species, isHidden: Bool, slot: Int) {
        self.id = id
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}

struct Species: Codable {
    var name: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

// MARK: - TypeElement

struct TypeElement: Codable, Identifiable {
    let id = UUID()
    let slot: Int
    let type: Species
    
    private enum CodingKeys: String, CodingKey {
        case slot, type
    }
    
    init(slot: Int, type: Species) {
        self.slot = slot
        self.type = type
    }
    
    func getIcon() -> String {
        switch self.type.name {
        case "normal": "circle.circle"
        case "fire": "flame"
        case "fighting": "figure.boxing"
        case "flying": "bird"
        case "poison": "exclamationmark.triangle.fill"
        case "ground": "globe.americas"
        case "rock": "mountain.2"
        case "bug": "ladybug"
        case "ghost": "face.dashed"
        case "steel": "batteryblock"
        case "water": "water.waves"
        case "grass": "leaf"
        case "electric": "bolt"
        case "psychic": "eye"
        case "ice": "snowflake"
        case "dragon": "lizard"
        case "dark": "moon.stars"
        default:
            "circle.circle"
        }
    }
}

// MARK: Stats

struct Stat: Codable, Identifiable {
    var id = UUID()
    let baseStat: Int
    let effort: Int
    let stat: Species
    
    private enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
    
    init(id: UUID = UUID(), baseStat: Int, effort: Int, stat: Species) {
        self.id = id
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
    
}
