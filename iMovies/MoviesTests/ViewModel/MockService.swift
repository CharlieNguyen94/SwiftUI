//
//  MockService.swift
//  iMovies
//
//  Created by Charlie Nguyen on 25/05/2021.
//

import Foundation

class MockService : ServiceProtocol {
    let mockData: [Movie]?
    
    init(mockData: [Movie]?) {
        self.mockData = mockData
    }
    
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        completion(mockData)
    }
}
