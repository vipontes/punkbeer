//
//  BeerListTableViewController.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 16/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit

class BeerListTableViewController: UITableViewController {
    
    private var beerListVM: BeerListViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        initData()
    }
    
    private func initData() {

        BeerService().getBeer(page: 1) { beers in
            
            if let beers = beers {
                self.beerListVM = BeerListViewModel(beers: beers)
                                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.beerListVM == nil ? 0 : self.beerListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.beerListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) 
        
        let beerVM = self.beerListVM.beerAtIndex(indexPath.row)
        
        cell.textLabel?.text = beerVM.name
        
        return cell
    }
}
