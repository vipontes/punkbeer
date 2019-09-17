//
//  FavoritesViewModel.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

protocol FavoritesViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
}

class FavoritesListViewModel {
    private weak var delegate: FavoritesViewModelDelegate?
    private var isFetchInProgress = false
    var beers: [Beer] = []
    
    init(delegate: FavoritesViewModelDelegate) {
        
        self.delegate = delegate
    }
    
    var currentCount: Int {
        
        return beers.count
    }
    
    var numberOfSections: Int {
        
        return 1
    }
    
    func beerAtIndex(_ index: Int) -> BeerViewModel {
        
        let beer = self.beers[index]
        return BeerViewModel(beer)
    }
    
    func fetch() {
        
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        
        BeerService().getFavorites() { res, strError in
            
            if let beers = res {
                self.isFetchInProgress = false
                self.beers = beers
                
                self.delegate?.onFetchCompleted()
            } else {
                self.isFetchInProgress = false
                self.delegate?.onFetchFailed(with: strError!)
            }
        }
    }
}

