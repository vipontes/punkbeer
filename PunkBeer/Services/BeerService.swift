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
    
    func getBeer(page: Int, completion: @escaping ([Beer]?) -> ()) {
        Alamofire.request("https://api.punkapi.com/v2/beers?page=\(page)&per_page=\(pageCount)").responseData { response -> Void in
            
            switch response.result {
            case .success:
                guard let data = response.data else {
                    completion(nil)
                    return
                }
                
                
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode([Beer].self, from: data)
                    completion(res)
                } catch let error {
                    print(error)
                    completion(nil)
                }
                
                break
                
            case .failure:
                completion(nil)
                break
            }
        }
    }
}
