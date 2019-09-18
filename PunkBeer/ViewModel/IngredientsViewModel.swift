//
//  IngredientsViewModel.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

enum sectionTitle: String {
    case hops = "HOPS"
    case malt = "MALT"
}

struct IngredientsViewModel {
    var ingredients: Ingredients
    
    init(ingredients: Ingredients) {
        self.ingredients = ingredients
    }
    
    var numberOfSections: Int {
        
        return 2
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if ( section == 0 ) {
            return ingredients.hops!.count
        } else if ( section == 1)  {
            return ingredients.malt!.count
        }
        
        return 0
    }
    
    func titleForHeaderInSection(section: Int) -> String {
        if ( section == 0 ) {
            return sectionTitle.hops.rawValue
        } else if ( section == 1)  {
            return sectionTitle.malt.rawValue
        }
        
        return ""
    }
    
    func hopsAtIndex(_ index: Int) -> Hops {
        
        let hops = self.ingredients.hops?[index]
        return hops!
    }
    
    func maltAtIndex(_ index: Int) -> Malt {
        
        let malt = self.ingredients.malt?[index]
        return malt!
    }
}
