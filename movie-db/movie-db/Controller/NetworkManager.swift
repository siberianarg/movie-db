//
//  NetworkManager.swift
//  movie-db
//
//  Created by siberianarg on 12.10.2024.
//

import Foundation

class NetworkManager {
    
    static var shared = NetworkManager()
    
    private let apiKey = "caf3a6290939575c31752adbb8bd341d"
    private let urlString = "https://api.themoviedb.org"
    private let session = URLSession(configuration: .default)
    
    private lazy var urlComponents: URLComponents = {
        var urlComp = URLComponents()
        urlComp.scheme = "https"
        urlComp.host = "api.themoviedb.org"
        urlComp.queryItems = [
        URLQueryItem(name: "api_key", value: apiKey)]
        
        return urlComp
    }()
    
    func loadMovie() {
        urlComponents.path = "/3/movie/now_playing"
        guard let url = urlComponents.url else { return }
        let task = session.dataTask(with: url) { data, _, error in
            if let error {
                print(error)
            }
        }
    }
}
