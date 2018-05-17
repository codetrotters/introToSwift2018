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

        if let pokemonResponse = convertData(to: PokemonResponse.self, data) {
            appData.updatePokemonList(with: pokemonResponse)
            return true
        } else {
            return false
        }
    }
    
    private func updatePokemonDetails(_ response: DataResponse<Any>) -> Bool {
        guard let data = response.data else { return false }
        
        if let pokemonDetailResponse = convertData(to: PokemonDetailResponse.self, data) {
            appData.updatePokemonImage(with: pokemonDetailResponse)
            return true
        } else {
            return false
        }
    }
}

extension QueryService {
    private func convertData<T:Decodable>(to type: T.Type, _ data: Data) -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: data)
    }
}
