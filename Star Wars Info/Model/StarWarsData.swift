//
//  StarWarsData.swift
//  Star Wars Info
//
//  Created by Forsmajor on 18.03.2024.
//

import Foundation

struct StarWarsData: Codable {
    let count: Int
    let results: [Movie]
    let charachters: [Charachter]
}


struct Movie: Codable {
    let title: String
    let episode_id: Int
}

struct Charachter: Codable {
    let name: String
    let height: String
    let weight: String
}
