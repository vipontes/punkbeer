//
//  Beer.swift
//  PunkBeer
//
//  Created by Vinicius Pontes on 16/09/19.
//  Copyright © 2019 EASIFY. All rights reserved.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name: String?
    let tagline: String?
    let firstBrewed: String?
    let description: String?
    let imageUrl: String?
    let abv: Double?
    let ibu: Double?
    let targetFg: Double?
    let targetOg: Double?
    let ebc: Double?
    let srm: Double?
    let ph: Double?
    let attenuationLevel: Double?
    let volume: Volume?
    let boilVolume: BoilVolume?
    
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageUrl = "image_url"
        case abv
        case ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc
        case srm
        case ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

struct Volume: Decodable {
    let value: Int
    let unit: String
    private enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}

struct BoilVolume: Decodable {
    let value: Int
    let unit: String
    private enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}

