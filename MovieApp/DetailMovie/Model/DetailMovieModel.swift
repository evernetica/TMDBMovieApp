//
//  DetailMovieModel.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation

// MARK: - DetailMovieModel
struct DetailMovieModel: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let spokenLanguages: [SpokenLanguage]?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let revenue, runtime: Int?
    let videos: Videos?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case revenue, runtime
        case videos
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let name, originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let name: String
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

// MARK: - Videos
struct Videos: Codable {
    let results: [ResultVideo]?
}

// MARK: - Result
struct ResultVideo: Codable, Identifiable{
    let key, name, id: String
    
    enum CodingKeys: String, CodingKey {
        case key, name, id
    }
}
