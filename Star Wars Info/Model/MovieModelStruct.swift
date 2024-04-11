//
//  SrarWarsModel.swift
//  Star Wars Info
//
//  Created by Forsmajor on 20.03.2024.
//

import Foundation

struct MovieModel: Codable {
    let movieModelArray: [MovieModelStruct]
}
struct MovieModelStruct: Codable {
    
    let episodeId: Int?
    let episodeName: String?
    
    var episodeRomeId: String {
        switch episodeId {
        case 1:
            return "Episode I"
        case 2:
            return "Episode II"
        case 3:
            return "Episode III"
        case 4:
            return "Episode IV"
        case 5:
            return "Episode V"
        case 6:
            return "Episode VI"
        default:
           return "Episode"
        }
    }
}
