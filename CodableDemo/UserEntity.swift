//
//  MovieEntity.swift
//  CodableDemo
//
//  Created by Manish on 28/11/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation

struct MovieEntity: Codable {
    let instructions, title, year, rated: String
    let released, runtime: String
    let genre: [String]
    let director: String
    let writers, actors: [String]
    let plot, language, country, awards: String
    let poster: String
    let imdbRating, imdbVotes, imdbID: String
    
    enum CodingKeys: String, CodingKey {
        case instructions = "Instructions"
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writers = "Writers"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case imdbRating, imdbVotes, imdbID
    }
}
