//
//  MoviesViewModelTests.swift
//  iMovies
//
//  Created by Charlie Nguyen on 25/05/2021.
//

import XCTest


class MoviesViewModelTests: XCTestCase {

    func testSuccessFetchData() {
        let expectedList = [Movie.with()]
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        
        viewModel.loadMovies()
        
        XCTAssertTrue(!viewModel.isLoading)
        XCTAssertEqual(viewModel.movies.results.count, 1)
        
    }
    
    func testEmptyData() {
        let expectedList = [Movie]()
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.loadMovies()
        
        XCTAssertTrue(!viewModel.isLoading)
        XCTAssertEqual(viewModel.movies.results.count, 0)
    }
    
    func testNilData() {
        let expectedList: [Movie]? = nil
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.loadMovies()
        
        XCTAssertTrue(!viewModel.isLoading)
        XCTAssertEqual(viewModel.movies.results.count, 0)
    }
    
    func testCorrectID() {
        let expectedList = [Movie.with()]
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.loadMovies()
        
        XCTAssertTrue(!viewModel.isLoading)
        XCTAssertEqual(viewModel.movies.results.first?.id, 49030)
        
    }
    
    func testCorrectTitle() {
        let expectedList = [Movie.with()]
        let service = MockService(mockData: expectedList)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.loadMovies()
        
        XCTAssertTrue(!viewModel.isLoading)
        XCTAssertEqual(viewModel.movies.results.first?.title, "Swift MVVM")
    }
    
    

}
