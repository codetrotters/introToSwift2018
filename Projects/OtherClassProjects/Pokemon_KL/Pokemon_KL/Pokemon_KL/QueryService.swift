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
        
        if let urlComponents = URLComponents(string: urlString) {
            guard let url = urlComponents.url else { return }
            
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
    }
}

extension QueryService {
    
    private func updatePokemonResults(_ data: Data) -> [Pokemon] {
        var response: JSONDictionary?
        var pokemon: [Pokemon] = []
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let error as NSError {
            errorMessage += "JSONSerialization error: \(error.debugDescription)"
        }
        
        let results = response?["results"] ?? []
        
        let jsonData = json(from: results)!
        let decoder = JSONDecoder()
        
        do {
            pokemon = try decoder.decode([Pokemon].self, from: jsonData)
        } catch {
            print("Error converting Data into structs")
        }
        
        return pokemon
    }
    
    func json(from object:Any) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return data
    }
}





