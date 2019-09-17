//
//  BeerDetailViewController.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

class BeerDetailViewController: UIViewController {
    
    var beerViewModel: BeerViewModel!
    
    @IBOutlet weak var favoriteButton: FavoriteButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var firstBrewedLabel: UILabel!

    @IBOutlet weak var ingredientsButton: UIButton!
    @IBOutlet weak var foodPearingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.detailBackgroundColor
        
        ingredientsButton.backgroundColor = Constants.menuBarColor
        foodPearingButton.backgroundColor = Constants.menuBarColor

        nameLabel?.text = beerViewModel.name
        taglineLabel?.text = beerViewModel.tagline
        descriptionLabel?.text = beerViewModel.description
        firstBrewedLabel?.text = beerViewModel.firstBrewed
        if let image = beerViewModel.imageUrl {
            beerImageView?.loadImage(fromURL: image)
        }

        self.checkFavorite()
    }
    
    func checkFavorite() {
        let favorites = beerViewModel.getFavorites()
        if favorites.first(where: { $0.id == beerViewModel.id }) != nil {
            favoriteButton.setFavorite(bool: true)
        }
    }
    
    @IBAction func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        
        if ( favoriteButton.getFavorite() ) {
            beerViewModel.addToFavorites()
        } else {
            beerViewModel.removeFromFavorites()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "IngredientsTableViewController" {
            guard let nav = segue.destination as? UINavigationController else {
                return
            }
            
            guard let vc = nav.viewControllers.first as? IngredientsTableViewController else {
                return
            }
            
            
        } else if segue.identifier == "FoodPairingTableViewController" {
            guard let nav = segue.destination as? UINavigationController else {
                return
            }
            
            guard let vc = nav.viewControllers.first as? FoodPairingTableViewController else {
                return
            }
            
            
        }
        
    }
}
