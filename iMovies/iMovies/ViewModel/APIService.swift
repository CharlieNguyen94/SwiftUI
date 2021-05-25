//
//  APIService.swift
//  iMovies
//
//  Created by Charlie Nguyen on 19/11/2020.
//

import Foundation
import Alamofire

fileprivate let apiBaseURL = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
let apiKey = "17e7941eacd803f7d4ddfa116e1139d2"

let imageBaseURL = "https://image.tmdb.org/t/p/original/"


class APIService: ServiceProtocol {
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        loadDataWithAlamofire(completion)
    }
    
    private func loadDataWithAlamofire(_ completion: @escaping ([Movie]?) -> Void) {
        AF.request("\(apiBaseURL)\(apiKey)")
            .responseJSON { response in
                guard let data = response.data else {
                    completion(nil)
                    return
                }
                guard let movies = try? JSONDecoder().decode(MovieList.self, from: data) else { return }
                DispatchQueue.main.async {
                    completion(movies.results)
                }
            }
    }
}
