//
//  ContentView.swift
//  iMovies
//
//  Created by Charlie Nguyen on 19/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ActivityIndicator(color: .blue, size: 50)
                } else {
                    if (viewModel.movies.results.count > 0) {
                        List(viewModel.movies.results) { movie in
                            NavigationLink(destination: MovieDetails(movie: movie)) {
                                MovieRow(movie: movie)
                            }
                        }
                    } else {
                        VStack(alignment: .center) {
                            Text("No movies or an error has occured.")
                        }
                    }
                }
            }
            .onAppear {
                self.viewModel.loadMovies()
            }
            .navigationBarTitle("iMovies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

