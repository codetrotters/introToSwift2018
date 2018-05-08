//
//  ViewController.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var pokemonList = [Pokemon]()
    let queryService = QueryService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        queryService.fetchOriginalPokemon { [weak self] (pokemon, error) in
            self?.pokemonList = pokemon ?? []
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokedexCell", for: indexPath) as! PokedexTableViewCell
        let pokemon = pokemonList[indexPath.row]
        
        cell.nameLabel.text = pokemon.name.firstLetterCapitalized
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let pokemon = pokemonList[indexPath.row]
        
        
    }
}
