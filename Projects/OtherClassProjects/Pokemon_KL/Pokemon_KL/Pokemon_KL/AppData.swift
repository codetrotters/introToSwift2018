//
//  AppData.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

final class AppData {
    
    static let shared = AppData()
    private init() {}
    
    private var pokemon: [Pokemon] = []
}

// MARK: - Public getters

extension AppData {
    var pokemonList: [Pokemon] {
        return pokemon
    }
}

// MARK: - Mutating functions

extension AppData {
    
    func updatePokemonList(with pokemonResponse: PokemonResponse?) {
        guard let response = pokemonResponse else { return }
        self.pokemon.append(contentsOf: response.results)
    }
    
    func updatePokemonImage(with pokemonDetailResponse: PokemonDetailResponse?) {
        guard let response = pokemonDetailResponse else { return }
        guard let indexOfPokemon = pokemon.index(where: { $0.id == response.id }) else { return }
        
        var pokemonToUpdate = pokemon[indexOfPokemon]
        pokemonToUpdate.imageURLString = response.sprites.frontShiny
        pokemon[indexOfPokemon] = pokemonToUpdate
    }
}






