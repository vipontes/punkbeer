//
//  BeerService.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 16/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation
import Alamofire

class BeerService {
    
    let pageCount = 25
    
    func getBeer(page: Int, completion: @escaping ([Beer]?, String?) -> ()) {
        Alamofire.request("\(Constants.apiUrl)?page=\(page)&per_page=\(pageCount)").responseData { response -> Void in
            
            switch response.result {
            case .success:
                guard let data = response.data else {
                    completion(nil, response.error?.localizedDescription)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode([Beer].self, from: data)
                    completion(res, nil)
                } catch let error {
                    print(error)
                    completion(nil, error.localizedDescription)
                }
                
                break
                
            case .failure:
                completion(nil, response.error?.localizedDescription)
                break
            }
        }
    }
    
    func getFavorites(completion: @escaping ([Beer]?, String?) -> ()) {
        
        let favorites = DBManager.sharedInstance.getDataFromDB()
        
        var ids = ""
        for item in favorites {
            ids += "\(item.id)|"
        }
        
        ids = ids.trimmingCharacters(in: CharacterSet(charactersIn: "|"))
        
        let url = "\(Constants.apiUrl)?ids=\(ids)"
        
        // Alamofire craches with | character
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        Alamofire.request(safeURL).responseData { response -> Void in
            
            switch response.result {
            case .success:
                guard let data = response.data else {
                    completion(nil, response.error?.localizedDescription)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode([Beer].self, from: data)
                    completion(res, nil)
                } catch let error {
                    print(error)
                    completion(nil, error.localizedDescription)
                }
                
                break
                
            case .failure:
                completion(nil, response.error?.localizedDescription)
                break
            }
        }
    }
}
