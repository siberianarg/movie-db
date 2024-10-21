//
//  ViewController.swift
//  movie-db
//
//  Created by siberianarg on 04.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var movieDBLabel: UILabel = {
        $0.text = "MovieDB"
        $0.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var movieTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        $0.register(MovieTableViewCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .none
        $0.backgroundColor = .white
        $0.rowHeight = 440
        return $0
    }(UITableView())
    
    var movies: [Result] = []

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        apiRequest()        
    }
    
    func apiRequest() {
        NetworkManager.shared.loadMovie { result in
            self.movies = result.results
            self.movieTableView.reloadData()
        }
    }
    
    // MARK: - Setup UI
    
    func setupUI() {
        view.backgroundColor = .white
        
        [movieDBLabel, movieTableView].forEach{view.addSubview($0)}
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieDBLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            movieDBLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 41),
            movieDBLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -41),
            movieDBLabel.heightAnchor.constraint(equalToConstant: 42),
            
            movieTableView.topAnchor.constraint(equalTo: movieDBLabel.bottomAnchor, constant: 10),
            movieTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieTableView.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Data Source and Delegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        let movie = movies[indexPath.row]
        NetworkManager.shared.loadImage(posterPath: movie.posterPath) { image in
            cell.posterImageView.image = image
        }
        cell.titleLabel.text = movie.title
        return cell
    }
}

