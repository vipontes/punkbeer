//
//  FavoritesTableViewController.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 17/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import UIKit
import Hero

class FavoritesTableViewController: UITableViewController, AlertDisplayer {
    
    private var viewModel: FavoritesListViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let refreshControl = UIRefreshControl()
        let title = "Pull to refresh your content"
        refreshControl.attributedTitle = NSAttributedString(string: title)
        refreshControl.addTarget(self, action:  #selector(pullToRefreshHandler), for: .valueChanged)
        self.refreshControl = refreshControl
        
        initData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.fetch()
    }
    
    private func initData() {
        
        viewModel = FavoritesListViewModel(delegate: self)
        viewModel.fetch()
    }
    
    @objc func pullToRefreshHandler() {
        
        self.viewModel.fetch()
        self.refreshControl?.endRefreshing()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "BeerDetailViewControllerFav" {
            
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

extension FavoritesTableViewController: FavoritesViewModelDelegate {
    func onFetchCompleted() {

        tableView.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        
        let title = "Atenção"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title , message: reason, actions: [action])
    }
}
