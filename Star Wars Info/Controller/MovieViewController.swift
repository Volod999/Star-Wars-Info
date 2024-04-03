//
//  ViewController.swift
//  Star Wars Info
//
//  Created by Forsmajor on 18.03.2024.
//

import UIKit

class MovieViewController: UIViewController {
    
    let defaultColor = UIColor.red
    //let episodeArray = ["Episode 1", "Episode 2", "Episode 3" ]
    
    @IBOutlet var wrapperView: UIView!
    @IBOutlet weak var episodeTableView: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    func configure() {
        
        wrapperView.backgroundColor = defaultColor
        //navigtaionController?.navigationBar.backgroundColor = defaultColor
        //self.testTableView.backgroundColor = .white
        
    }
}

//MARK: - TableView Datasource Methods

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let movie = movies[indexPath.row]
        cell?.textLabel?.text = "\(movie.episodeID). \(movie.title)"
        return cell!
    }
    
}

//MARK: - TableView Delegate Methods

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}


