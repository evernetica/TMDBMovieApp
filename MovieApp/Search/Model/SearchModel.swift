//
//  SearchModel.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation
import UIKit

class SearchModel {
    let image: String?
    let movieTitle: String
    let voteAverage: Double
    let releaseDate: String
    let overview: String
    
    init(model: Result) {
        self.image = model.posterPath
        self.movieTitle = model.originalTitle
        self.voteAverage = model.voteAverage
        self.releaseDate = model.releaseDate
        self.overview = model.overview
    }
}
