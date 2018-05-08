//
//  QueryService.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

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
    typealias PokemonQueryResult = ([Pokemon]?, String) -> ()
    typealias SuccessResult = (Bool, String) -> ()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    var errorMessage = ""
    var pokemonList = [Pokemon]()
}

extension QueryService {
    
    func fetchOriginalPokemon(completion: @escaping PokemonQueryResult) {
        
        dataTask?.cancel()
        
        let urlString = APIResourceURL.pokemon.url
        let url = URL(string: urlString)!

        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
        
                self.errorMessage += "Data error: " + error.localizedDescription
    
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                let pokemonList = self.updatePokemonResults(data)
                
                DispatchQueue.main.async {
                    completion(pokemonList, self.errorMessage)
                }
            }
        })
        
        dataTask?.resume()
    }
    
    func fetchPokemonDetailsWith(_ urlString: String, completion: @escaping SuccessResult) {
        
        
        
    }
}

extension QueryService {
    
    private func updatePokemonResults(_ data: Data) -> [Pokemon] {
        var pokemonResponse: PokemonResponse?
        let decoder = JSONDecoder()
        
        do {
            pokemonResponse = try decoder.decode(PokemonResponse.self, from: data)
        } catch let error {
            print(error)
        }
        
        return pokemonResponse?.results ?? []
    }
    
    func json(from object:Any) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return data
    }
}





