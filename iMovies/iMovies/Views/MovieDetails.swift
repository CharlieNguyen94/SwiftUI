//
//  MovieDetails.swift
//  iMovies
//
//  Created by Charlie Nguyen on 19/11/2020.
//

import SwiftUI
import URLImage

struct MovieDetails: View {
    var viewModel = MovieViewModel()
    var movie: Movie
    
    var body: some View {
        VStack {
            URLImage(url: URL(string: "\(imageBaseURL)\(movie.poster_path)")!, content: { image in
                image
                    .resizable()
                    .clipped()
                    .frame(width: UIScreen.main.bounds.height / 8 * 3, height: UIScreen.main.bounds.height / 2)
            })
                HStack {
                    Text("Description:")
                        .underline()
                        .foregroundColor(.blue)
                        .font(.system(size: 25))
                        .padding()
                    Spacer()
                }
            
            Text(movie.overview)
                .lineLimit(nil)
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding(.horizontal)
            
        }
        
        // Inline will put title and back button in the same row
        .navigationBarTitle(Text(movie.title), displayMode: .inline)
        .padding()
    }
}


struct MovieDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieDetails(movie: Movie(popularity: 1739.004, vote_count: 196, id: 671039, vote_average: 6.1, title: "Rogue City", poster_path: "/9HT9982bzgN5on1sLRmc1GMn6ZC.jpg", original_language: "fr", original_title: "Bronx", adult: false, overview: "Caught in the crosshairs of police corruption and Marseille’s warring gangs, a loyal cop must protect his squad by taking matters into his own hands.", release_date: "2020-10-30"))
            
    }
}
