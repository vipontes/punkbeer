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
    let ingredients: Ingredients?
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
        case ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

struct Volume: Decodable {
    let value: Int?
    let unit: String?
    private enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}

struct BoilVolume: Decodable {
    let value: Int?
    let unit: String?
    private enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}

struct Ingredients: Decodable {
    let malt: [Malt]?
    let hops: [Hops]?
    private enum CodingKeys: String, CodingKey {
        case malt
        case hops
    }
}

struct Malt: Decodable {
    let name: String?
    let amount: MaltAmount?
    private enum CodingKeys: String, CodingKey {
        case name
        case amount
    }
}

struct MaltAmount: Decodable {
    let value: Double?
    let unit: String?
    private enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}
struct Hops: Decodable {
    let name: String?
    let amount: HopsAmount?
    let add: String?
    let attribute: String?
    private enum CodingKeys: String, CodingKey {
        case name
        case amount
        case add
        case attribute
    }
}

struct HopsAmount: Decodable {
    let value: Double?
    let unit: String?
    private enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}
