//
//  MovieDetailViewController.swift
//  movie-db
//
//  Created by siberianarg on 21.10.2024.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {

        return $0
    }(UIScrollView())
    
    private lazy var posterImageView: UIImageView = {
        $0.image = UIImage(named: "movie")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.text = "Uncharted"
        $0.font = .systemFont(ofSize: 48, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        [posterImageView, titleLabel].forEach { scrollView.addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(424)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
}
