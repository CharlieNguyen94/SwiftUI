//
//  MovieRow.swift
//  iMovies
//
//  Created by Charlie Nguyen on 19/11/2020.
//

import SwiftUI
import URLImage

struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            URLImage(url: URL(string: "\(imageBaseURL)\(movie.poster_path)")!, content: { image in
                image
                    .resizable()
                    .clipped()
                    .frame(width: 90 , height: 120)
            })
            VStack {
                Spacer()
                HStack {
                    Text(movie.title)
                        .foregroundColor(.blue)
                        .font(.headline)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer() // Help align the title to the left
                }
                Spacer()
                HStack {
                    Text(movie.release_date)
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text("Vote Count: \(movie.vote_count)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Popularity: \(movie.popularity.formatPopularity())")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Ratings: \(movie.vote_average.format())")
                    Spacer()
                }
                Spacer()
            }
        } .frame(height: 150)
    }
}

extension Float {
    func format() -> String {
        return String(format: "%.2f", self)
    }
    
    func formatPopularity() -> String {
        return String(format: "%.0f", self)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(popularity: 1739.004, vote_count: 196, id: 671039, vote_average: 6.1, title: "Rogue City", poster_path: "/9HT9982bzgN5on1sLRmc1GMn6ZC.jpg", original_language: "fr", original_title: "Bronx", adult: false, overview: "Caught in the crosshairs of police corruption and Marseille’s warring gangs, a loyal cop must protect his squad by taking matters into his own hands.", release_date: "2020-10-30"))
        
    }
}
