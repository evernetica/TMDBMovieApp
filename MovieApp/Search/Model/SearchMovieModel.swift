//
//  SearchMovieModel.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation

// MARK: - SearchMovie
struct SearchMovieModel: Codable, Identifiable, Hashable {
    let id: Int?
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results, id
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    static var placeholder: Self {
        return SearchMovieModel(id: nil, page: nil, results: nil, totalPages: nil, totalResults: nil)
    }
}

// MARK: - Result
struct Result: Codable, Identifiable, Hashable {
    
    let id: Int
    let originalTitle, overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
