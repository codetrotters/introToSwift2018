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
    typealias SuccessResult = (Bool, String) -> ()
    
    let appData = AppData.shared
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    var errorMessage = ""
}

extension QueryService {
    
    func fetchOriginalPokemon(completion: @escaping SuccessResult) {
        
        dataTask?.cancel()
        
        let urlString = APIResourceURL.pokemon.url
        let url = URL(string: urlString)!

        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
        
                self.errorMessage += "Data error: " + error.localizedDescription
                
                DispatchQueue.main.async {
                    completion(false, self.errorMessage)
                }
    
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                let didUpdatePokemon = self.updatePokemonResults(data)
                
                DispatchQueue.main.async {
                    completion(didUpdatePokemon, self.errorMessage)
                }
            }
        })
        
        dataTask?.resume()
    }
    
    func fetchPokemonDetailsWith(_ urlString: String, completion: @escaping SuccessResult) {
        
        dataTask?.cancel()
        
        let url = URL(string: urlString)!
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                
                self.errorMessage += "Error: " + error.localizedDescription
                
                DispatchQueue.main.async {
                    completion(false, self.errorMessage)
                }
                
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                let didUpdatePokemonDetail = self.updatePokemonDetails(data)
            
                DispatchQueue.main.async {
                    completion(didUpdatePokemonDetail, self.errorMessage)
                }
            }
        })
        
        dataTask?.resume()
    }
}

extension QueryService {
    
    private func updatePokemonResults(_ data: Data) -> Bool {
        var pokemonResponse: PokemonResponse?
        let decoder = JSONDecoder()
        
        do {
            pokemonResponse = try decoder.decode(PokemonResponse.self, from: data)
            appData.updatePokemonList(with: pokemonResponse)
            return true
            
        } catch {
            return false
        }
    }
    
    private func updatePokemonDetails(_ data: Data) -> Bool {
        var pokemonDetailResponse: PokemonDetailResponse?
        let decoder = JSONDecoder()
        
        do {
           pokemonDetailResponse = try decoder.decode(PokemonDetailResponse.self, from: data)
            appData.updatePokemonImage(with: pokemonDetailResponse)
            return true
            
        } catch {
            return false
        }
    }
    
    func json(from object:Any) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return data
    }
}





