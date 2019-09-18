//
//  FoodPairingTableViewController.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit
import Hero

class FoodPairingTableViewController: UITableViewController, AlertDisplayer {
    
    var viewModel: FoodPairingViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    @IBAction func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodPairingCell", for: indexPath)
        
        let value = self.viewModel.foodPairing[indexPath.row]
        
        cell.textLabel?.text = value
        
        return cell
    }
}
