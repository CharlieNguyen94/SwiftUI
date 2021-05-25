//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Charlie Nguyen on 25/05/2021.
//

import XCTest

class MoviesTests: XCTestCase {

    func testSuccessParser() {
        let json = """
        {
            "id": 49030,
            "popularity": 7.8,
            "vote_count": 4,
            "vote_average": 4.5,
            "title": "Swift MVVM",
            "poster_path": "path",
            "original_language": "En",
            "original_title": "Swift MVVM",
            "adult": false,
            "overview": "Overview",
            "release_date": "2019-12-1T00 20:10:00"
        }
        """.data(using: .utf8)!
        
        let movie = try! JSONDecoder().decode(Movie.self, from: json)
        
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.id, Movie.with().id)
    }

}
