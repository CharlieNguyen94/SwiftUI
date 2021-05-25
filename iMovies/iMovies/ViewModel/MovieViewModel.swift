//
//  MovieViewModel.swift
//  iMovies
//
//  Created by Charlie Nguyen on 19/11/2020.
//

import Foundation

import Combine

class MovieViewModel: ObservableObject {
    @Published var movies = MovieList(results: [])
    @Published var isLoading = false
    
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
        
    }
    
    func loadMovies() {
        self.isLoading = true
        service.fetchPopularMovies { movies in
            self.isLoading = false
            guard let movies = movies else { return }
            self.movies.results = movies
        }
    }
}
