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
    
    var viewModel: IngredientsViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        self.tableView.register(UINib(nibName: "HopsTableViewCell", bundle: nil), forCellReuseIdentifier: "HopsCell")
        self.tableView.register(UINib(nibName: "MaltTableViewCell", bundle: nil), forCellReuseIdentifier: "MaltCell")

        // Esta linha foi comentada o app está configurado para iOS 10.3 e o recurso abaixo só está disponível a partis do iOS 11
        // self.navigationController?.navigationBar.prefersLargeTitles = true
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:18))
        let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:18))
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = self.viewModel.titleForHeaderInSection(section: section);
        label.textColor = UIColor.white
        view.addSubview(label);
        view.backgroundColor = UIColor.gray;
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch (indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HopsCell") as! HopsTableViewCell
            cell.nameLabel?.text = self.viewModel.hopsAtIndex(indexPath.row).name
            cell.valueLabel?.text = self.viewModel.hopsAtIndex(indexPath.row).amount?.value?.toString()
            cell.unitLabel?.text = self.viewModel.hopsAtIndex(indexPath.row).amount?.unit
            cell.addLabel?.text = self.viewModel.hopsAtIndex(indexPath.row).add
            cell.attributeLabel?.text = self.viewModel.hopsAtIndex(indexPath.row).attribute
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MaltCell") as! MaltTableViewCell
            cell.nameLabel?.text = self.viewModel.maltAtIndex(indexPath.row).name
            cell.valueLabel?.text = self.viewModel.maltAtIndex(indexPath.row).amount?.value?.toString()
            cell.unitLabel?.text = self.viewModel.maltAtIndex(indexPath.row).amount?.unit
            return cell
        default:
            return UITableViewCell()
        }
    }
}
