//
//  NetworkManager.swift
//  movie-db
//
//  Created by siberianarg on 12.10.2024.
//

import Foundation
import UIKit

class NetworkManager {
    
    static var shared = NetworkManager()
    
    private let apiKey = "caf3a6290939575c31752adbb8bd341d"
    private let session = URLSession(configuration: .default)
    private let urlImageString = "https://image.tmdb.org/t/p/w500"
    private lazy var urlComponents: URLComponents = {
        var urlComp = URLComponents()
        urlComp.scheme = "https"
        urlComp.host = "api.themoviedb.org"
        urlComp.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        return urlComp
    }()
    
    func loadMovie(complition: @escaping (Movie)->()) {
        urlComponents.path = "/3/movie/now_playing"
        guard let url = urlComponents.url else { return }
        DispatchQueue.global().async {
            let task = self.session.dataTask(with: url) { data, _, error in
                if let error {
                    print(error)
                }
                guard let data else { return }
                if let movies = try? JSONDecoder().decode(Movie.self,from: data) {
                    DispatchQueue.main.async {
                        complition(movies)
                    }
                }
            }
            task.resume()
        }
    }
    
    func loadImage(posterPath: String, complition: @escaping (UIImage) -> ()) {
        let urlString = urlImageString + posterPath
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            let task = self.session.dataTask(with: url) { data, _, error in
                if let error {
                    print(error)
                }
                guard let data else { return }
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        complition(image)
                    }
                }
            }
            task.resume()
        }
    }
    
    func loadMovieDetail(movieID: Int, complition: @escaping (MovieDetail)->()) {
        urlComponents.path = "/3/movie/\(movieID)"
        guard let url = urlComponents.url else { return }
        DispatchQueue.global().async {
            let task = self.session.dataTask(with: url) { data, _, error in
                if let error {
                    print(error)
                }
                guard let data else { return }
                if let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) {
                    DispatchQueue.main.async {
                        complition(movieDetail)
                    }
                }
            }
            task.resume()
        }
    }
}


