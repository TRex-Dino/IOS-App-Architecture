//
//  NetworkService.swift
//  MVP IOS Dev
//
//  Created by Dmitry on 23.07.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(complition: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComments(complition: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                complition(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                complition(.success(obj))
            }
            catch {
                complition(.failure(error))
            }
            
        }.resume()
    }
}
