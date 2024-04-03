//
//  StarWarsData.swift
//  Star Wars Info
//
//  Created by Forsmajor on 18.03.2024.
//

import Foundation

struct StarWarsData {
    let movies: [Movie]
    let charachters: [Charachter]
}

struct Movie: Codable {
    let title: String
    let episodeID: Int
}

struct Charachter: Codable {
    let name: String
    let height: String
    let weight: String
}
