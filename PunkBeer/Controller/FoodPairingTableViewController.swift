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
    
    private var viewModel: FavoritesListViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    @IBAction func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
