//
//  ViewController.swift
//  Star Wars Info
//
//  Created by Forsmajor on 18.03.2024.
//

import Foundation
import UIKit

class MovieViewController: UIViewController {
    
    let defaultColor = UIColor.blue
    
    @IBOutlet var wrapperView: UIView!
    @IBOutlet weak var episodeTableView: UITableView!
    
    var dataManager = StarWarsManager()
    var model: [MovieModelStruct]?
    var movies: [StarWarsData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        dataManager.fetchMovie()
        dataManager.delegate = self

    }
    
    func configure() {
        wrapperView.backgroundColor = defaultColor
        navigationController?.navigationBar.backgroundColor = defaultColor
        episodeTableView.backgroundColor = .white
    }
}

//MARK: - TableView Datasource Methods

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  movies?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell
        let movie = model?[indexPath.row]
        dataManager.fetchMovie()
        
            if let episode = movie?.episodeRomeId {
                cell?.episodeId.text = episode
            }
            if let title = movie?.episodeName {
                cell?.episodeName.text = title
            }
        
        
        
        return cell!
    }
    
}


//MARK: - TableView Delegate Methods

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
//MARK: - StarWars Manager Delegate

extension MovieViewController: StarWarsManagerDelegate {
    
    func didUpdateStarWars(_ starWarsManager: StarWarsManager, starWars: [MovieModelStruct]) {
        model = starWars
        DispatchQueue.main.async {
            self.episodeTableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
     
}


