//
//  BeerListViewModel.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 16/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//
import Foundation

protocol BeerViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
}

struct BeerViewModel {
    private let beer: Beer
}

extension BeerViewModel {
    
    init(_ beer: Beer) {
        
        self.beer = beer
    }
}

extension BeerViewModel {
    func addToFavorites() {
        let item = Favorite()
        item.id = self.beer.id!
        DBManager.sharedInstance.addData(object: item)
    }
    
    func removeFromFavorites() {
        let item = Favorite()
        item.id = self.beer.id!
        DBManager.sharedInstance.deleteFromDb(object: item)
    }
    
    func getFavorites() -> [Favorite] {
        return DBManager.sharedInstance.getDataFromDB().toArray(ofType: Favorite.self) as [Favorite]
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
    
    var ingredients: Ingredients? {
        
        return self.beer.ingredients
    }
    
    var foodPairing: [String]? {
        
        return self.beer.foodPairing
    }
}

class BeerListViewModel {
    private weak var delegate: BeerViewModelDelegate?
    private var currentPage = 1
    private var bottom = false
    private var isFetchInProgress = false
    var beers: [Beer] = []
    
    init(delegate: BeerViewModelDelegate) {
        
        self.delegate = delegate
    }
    
    var reachedBottom: Bool {
        
        return bottom
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
        
        BeerService().getBeer(page: self.currentPage) { res, strError in

            if let beers = res {
                
                // chegou na última página
                if (beers.count == 0) {
                    self.isFetchInProgress = false
                    self.bottom = true
                    self.delegate?.onFetchCompleted()
                    return
                }
                
                self.currentPage += 1
                self.isFetchInProgress = false
                self.beers.append(contentsOf: beers)
                
                self.delegate?.onFetchCompleted()
            } else {
                self.isFetchInProgress = false
                self.delegate?.onFetchFailed(with: strError!)
            }
        }
    }
}
