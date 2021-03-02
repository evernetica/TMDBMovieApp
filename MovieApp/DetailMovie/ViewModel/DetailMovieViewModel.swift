//
//  DetailMovieViewModel.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation
import Combine
import XCDYouTubeKit

final class DetailMovieViewModel: ObservableObject {
    
    @Published var movieId: Int = 0
    @Published var movieDetail: DetailMovieModel?
    private var cancellable: AnyCancellable?
    private var cancellableSet = Set<AnyCancellable>()
    
    func getailInfo(movieId: Int) {
        cancellable = MovieAPI.shared.getdetailMovieInfo(movieId: movieId)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { movieDetail in
                    debugPrint("movieDetail", movieDetail)
                    self.movieDetail = movieDetail
            })
    }
}
