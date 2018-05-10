//
//  PokemonSprites.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/8/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

struct PokemonSprites: Codable {
    var frontShiny: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case frontShiny = "front_shiny"
    }
}
