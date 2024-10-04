//
//  ViewController.swift
//  movie-db
//
//  Created by siberianarg on 04.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var movieDBLabel: UILabel = {
        let label = UILabel()
        label.text = "MovieDB"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(movieDBLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieDBLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            movieDBLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 41),
            movieDBLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -41),
            movieDBLabel.heightAnchor.constraint(equalToConstant: 42)
        ])
    }


}

