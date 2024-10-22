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
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var relizeDateLabel: UILabel = {
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    var movieID: Int?
    private var movieDetail: MovieDetail?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        apiCall()
    }
    
    private func apiCall() {
        guard let movieID else { return  }
        NetworkManager.shared.loadMovieDetail(movieID: movieID) { result in
            self.movieDetail = result
            guard let movieDetail = self.movieDetail else { return }
            NetworkManager.shared.loadImage(posterPath: movieDetail.posterPath!) { result in
                self.posterImageView.image = result
            }
            self.titleLabel.text = movieDetail.title
            self.relizeDateLabel.text = "Release date " + (movieDetail.releaseDate ?? "no data")
        }
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        [posterImageView, titleLabel, relizeDateLabel].forEach { scrollView.addSubview($0) }
        
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
            $0.height.equalTo(60)
        }
        
        relizeDateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().offset(16)
        }
    }
}
