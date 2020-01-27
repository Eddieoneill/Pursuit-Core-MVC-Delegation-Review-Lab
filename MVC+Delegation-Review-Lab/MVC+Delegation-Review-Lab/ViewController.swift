//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

protocol TextFontSizeDelegate {
    func updateFontSize(size: CGFloat)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = Movie.allMovies
    var fontSize: CGFloat = 17
    var delegate: TextFontSizeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SettingsViewController {
            vc.delegate = self
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TheMovieCell", for: indexPath)
        cell.textLabel?.text = self.movies[indexPath.row].name
        cell.detailTextLabel?.text = "\(self.movies[indexPath.row].year)"
        cell.textLabel?.font = cell.textLabel?.font.withSize(fontSize)
        cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(fontSize)
        
        return cell
    }
    
}

extension ViewController: TextFontSizeDelegate {
    func updateFontSize(size: CGFloat) {
        fontSize = size
    }
}


