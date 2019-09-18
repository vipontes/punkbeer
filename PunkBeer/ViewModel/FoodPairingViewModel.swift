//
//  FoodPairingViewModel.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 18/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

struct FoodPairingViewModel {
    var foodPairing: [String]
    
    init(foodPairing: [String]) {
        self.foodPairing = foodPairing
    }
    
    var numberOfSections: Int {
        
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        
        return self.foodPairing.count
    }
    
}
