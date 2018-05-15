//
//  QueryService.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation
import Alamofire

enum APIResourceURL: String {
    case pokemon
    case berries
    
    static let baseURL = "http://pokeapi.co/api/v2/"
    
    var url: String {
        return APIResourceURL.baseURL + self.rawValue
    }
}

class QueryService {
    typealias JSONDictionary = [String: Any]
    typealias SuccessResult = (Bool, String) -> ()
    
    let appData = AppData.shared
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var dataTasks = [URLSessionDataTask]()
    
    var nextPageURL: String?
    var errorMessage = ""
    
    var nextURLString: String {
        return (nextPageURL != nil) ? nextPageURL! : APIResourceURL.pokemon.url
    }
}

extension QueryService {
    
    func fetchOriginalPokemon(completion: @escaping SuccessResult) {
        Alamofire.request(nextURLString).responseJSON { (response) in
            
            let didUpdatePokemon = self.updatePokemonResults(response)
            completion(didUpdatePokemon, self.errorMessage)
        }
    }
    
    func fetchPokemonDetailsWith(_ urlString: String, completion: @escaping SuccessResult) {
        
        Alamofire.request(urlString).responseJSON { (response) in
            let didUpdateDetails = self.updatePokemonDetails(response)
            completion(didUpdateDetails, self.errorMessage)
        }
    }
}

extension QueryService {
    
    private func updatePokemonResults(_ response: DataResponse<Any>) -> Bool {
        guard let data = response.data else { return false }
        let decoder = JSONDecoder()
        
        do {
            let pokemonResponse = try decoder.decode(PokemonResponse.self, from: data)
            nextPageURL = pokemonResponse.next
            appData.updatePokemonList(with: pokemonResponse)
            return true
            
        } catch {
            return false
        }
    }
    
    private func updatePokemonDetails(_ response: DataResponse<Any>) -> Bool {
        guard let data = response.data else { return false }
        let decoder = JSONDecoder()
        
        do {
            let pokemonDetailResponse = try decoder.decode(PokemonDetailResponse.self, from: data)
            appData.updatePokemonImage(with: pokemonDetailResponse)
            return true
            
        } catch {
            return false
        }
    }
}
