//
//  IngredientsTableViewController.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit
import Hero

class IngredientsTableViewController: UITableViewController, AlertDisplayer {
    
    private var viewModel: IngredientsViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        initData()
    }
    
    private func initData() {
        

    }

    @IBAction func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.numberOfRowsInSection(section: section)
    }
    

}
