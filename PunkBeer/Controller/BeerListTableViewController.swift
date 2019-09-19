//
//  BeerListTableViewController.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 16/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit
import Hero

class BeerListTableViewController: UITableViewController, AlertDisplayer {
    
    private var viewModel: BeerListViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        tableView.isHidden = true

        // Esta linha foi comentada o app está configurado para iOS 10.3 e o recurso abaixo só está disponível a partis do iOS 11
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 44)
        self.tableView.tableFooterView = spinner
        
        initData()
    }
    
    private func initData() {

        viewModel = BeerListViewModel(delegate: self)
        viewModel.fetch()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.currentCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerTableViewCell
        
        let beerVM = self.viewModel.beerAtIndex(indexPath.row)
        
        cell.minHeight = 150
        
        cell.nameLabel?.text = beerVM.name
        cell.taglineLabel?.text = beerVM.tagline
        if let image = beerVM.imageUrl {
            cell.beerImageView?.loadImage(fromURL: image)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if (indexPath.row == (viewModel.currentCount - 1) && !viewModel.reachedBottom ) {
            viewModel.fetch()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "BeerDetailViewController" {
            
            guard let nav = segue.destination as? UINavigationController else {
                return
            }
            
            guard let vc = nav.viewControllers.first as? BeerDetailViewController else {
                return
            }
            
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            
            nav.hero.isEnabled = true
            nav.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .left), dismissing: .zoomSlide(direction: .right))
            
            let vm = self.viewModel.beerAtIndex(indexPath.row)

            vc.beerViewModel = vm
        }
    }
}

extension BeerListTableViewController: BeerViewModelDelegate {
    func onFetchCompleted() {

        tableView.isHidden = false
        tableView.reloadData()        
        if ( viewModel.reachedBottom ) {
            self.tableView.tableFooterView = nil
        }
    }
    
    func onFetchFailed(with reason: String) {
        
        let title = "Atenção"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title , message: reason, actions: [action])
    }
}
