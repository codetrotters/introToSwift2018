//
//  PokemonDetailResponse.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/8/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

struct PokemonDetailResponse:Codable {
    var id: Int = 0
    var sprites = PokemonSprites()
}
