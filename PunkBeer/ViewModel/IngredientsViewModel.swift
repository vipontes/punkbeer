//
//  IngredientsViewModel.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation


struct IngredientsViewModel {
    var ingredients: Ingredients
    
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
}
