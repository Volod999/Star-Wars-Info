//
//  StarWarsData.swift
//  Star Wars Info
//
//  Created by Forsmajor on 18.03.2024.
//

import Foundation

struct StarWarsData: Codable {
    let results: [Movie]
    //let charachters: [Charachter]
}

struct Movie: Codable {
    let episode_id: Int
    let title: String
    
}

//struct Charachter: Codable {
//    let name: String
//    let height: String
//    let weight: String
//}
