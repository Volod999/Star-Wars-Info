//
//  StarWarsManager.swift
//  Star Wars Info
//
//  Created by Forsmajor on 18.03.2024.
//

import Foundation

protocol StarWarsManagerDelegate {
    func didUpdateStarWars(_ starWarsManager: StarWarsManager, starWars: [MovieModelStruct])
    func didFailWithError(error: Error)
}

struct StarWarsManager {
    
    let starWarsURL = "https://swapi.dev/api/"
    
    var delegate: StarWarsManagerDelegate?
    
    func fetchMovie() {
        let urlString = "\(starWarsURL)films/"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, responce, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let starWars = self.parseJSON(starWarsData: safeData) {
                        self.delegate?.didUpdateStarWars(self, starWars: starWars)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(starWarsData: Data) -> [MovieModelStruct]? {
        
        var modelStructArray: [MovieModelStruct] = []
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(StarWarsData.self, from: starWarsData)
            for i in starWarsData {
                let episode = decodedData.results[i].episode_id
                let title = decodedData.results[i].title
            }
                return modelStructArray
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
