//
//  ServiceProtocol.swift
//  iMovies
//
//  Created by Charlie Nguyen on 19/11/2020.
//

import Foundation

protocol ServiceProtocol {
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void)
}
