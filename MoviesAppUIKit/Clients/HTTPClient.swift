//
//  HTTPClient.swift
//  MoviesAppUIKit
//
//  Created by Ravikanth  on 10/26/23.
//

import Foundation
import Combine

enum Network: Error {
    case baseURL
    case inValidURL

}

class HTTPClient {
    
    func fetchMoVies(search:String) -> AnyPublisher<[Movie], Error> {
        guard let encodedSearch = search.urlEncoded,
              let url = URL(string: "https://www.omdbapi.com/?s=\(encodedSearch)&page=2&apikey=7843a2c3")
        else {
            return Fail(error: Network.baseURL).eraseToAnyPublisher()
        }
    
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.Search)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie],Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
