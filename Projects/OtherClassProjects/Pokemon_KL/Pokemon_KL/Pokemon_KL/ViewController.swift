//
//  ViewController.swift
//  Pokemon_KL
//
//  Created by Kevin Lopez on 5/3/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let queryService = QueryService()
    let appData = AppData.shared
    var pokemonList: [Pokemon] {
        return appData.pokemonList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load Next Page", style: .plain, target: self, action: #selector(loadOriginalPokemon))
        loadOriginalPokemon()
    }
    
    @objc private func loadOriginalPokemon() {
        queryService.fetchOriginalPokemon { [weak self] (_, _) in
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
        cell.pokedexNumberLabel.text = "#\(pokemon.id)"
        
        if let imageURL = URL(string: pokemon.imageURLString ?? "") {
            cell.pokemonImageView.af_setImage(withURL: imageURL, completion: { (_) in
                DispatchQueue.main.async {
                    cell.setNeedsLayout()
                }
            })
        } else {
            cell.pokemonImageView.image = nil
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let pokemon = pokemonList[indexPath.row]
        
        queryService.fetchPokemonDetailsWith(pokemon.url) { [weak self] (success, error) in
            if success {
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let totalPokemonCount = pokemonList.count
        let currentRow = indexPath.row
        
        if (totalPokemonCount - 1) == currentRow {
            print("We're at the bottom")
            loadOriginalPokemon()
        }
    }
}
