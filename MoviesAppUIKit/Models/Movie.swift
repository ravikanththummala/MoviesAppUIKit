//
//  Movie.swift
//  MoviesAppUIKit
//
//  Created by Ravikanth  on 10/26/23.
//

import Foundation

struct Movie: Decodable {
    
    let title: String
    let year:  String
    let type:  String
    let poster: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
    
}


struct MovieResponse: Decodable {
    let Search:[Movie]
}
