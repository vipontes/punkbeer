//
//  BeerListViewModel.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 16/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//
import Foundation

struct BeerViewModel {
    private let beer: Beer
}

extension BeerViewModel {
    
    init(_ beer: Beer) {
        
        self.beer = beer
    }
}

extension BeerViewModel {
    
    var id: Int? {
        
        return self.beer.id
    }
    
    var name: String? {
        
        return self.beer.name
    }
    
    var tagline: String? {
        
        return self.beer.tagline
    }
    
    var firstBrewed: String? {
        
        return self.beer.firstBrewed
    }
    
    var description: String? {
        
        return self.beer.description
    }
    
    var imageUrl: String? {
        
        return self.beer.imageUrl
    }
}

class BeerListViewModel {
    var beers: [Beer]
    
    init(beers:[Beer]) {
        self.beers = beers
        
    }
}

extension BeerListViewModel {
    
    var numberOfSections: Int {
        
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        
        return self.beers.count
    }
    
    func beerAtIndex(_ index: Int) -> BeerViewModel {
        
        let beer = self.beers[index]
        return BeerViewModel(beer)
    }
}
