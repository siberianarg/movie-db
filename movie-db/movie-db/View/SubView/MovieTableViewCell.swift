//
//  MovieTableViewCell.swift
//  movie-db
//
//  Created by siberianarg on 04.10.2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    lazy var posterImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        return $0
    }(UIImageView())

    lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return $0
    }(UILabel())
    
    lazy var stackView: UIStackView = {
        let spacing: CGFloat = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = spacing
        return $0
    }(UIStackView())
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(posterImageView)
        stackView.addArrangedSubview(titleLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44)
        ])
    }
}
