//
//  String+Extensions.swift
//  MoviesAppUIKit
//
//  Created by Ravikanth 10/26/23.
//

import Foundation

extension String {
    
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
}
