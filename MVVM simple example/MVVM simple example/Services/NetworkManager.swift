//
//  NetworkManager.swift
//  MVVM simple example
//
//  Created by Dmitry on 17.07.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let api = "https://breakingbadapi.com/api/characters"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ characters: [Character]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let characters = try decoder.decode([Character].self, from: data)
                DispatchQueue.main.async {
                    completion(characters)
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
