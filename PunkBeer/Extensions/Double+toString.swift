//
//  Double+toString.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 18/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%.3f",self)
    }
}
