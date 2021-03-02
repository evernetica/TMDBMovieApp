//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation
import Combine

final class SearchViewModel : ObservableObject {
    
    @Published var movieQuery: String = ""
    @Published var movieArray: [Result] = []
    private var cancellableSet = Set<AnyCancellable>()
    var currentPage = 1
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        $movieQuery
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { (movieQuery: String) -> AnyPublisher<SearchMovieModel, Never> in
                MovieAPI.shared.searchMovie(search: movieQuery, page: 1)
            }
            .map({ movie in movie.results ?? []})
            .assign(to: \.movieArray , on: self)
            .store(in: &cancellableSet)
    }

    func loadMoreMovie() {
        self.currentPage += 1
        MovieAPI.shared.searchMovie(search: movieQuery, page: self.currentPage)
            .sink { (item) in
                self.movieArray += item.results ?? []
            }
            .store(in: &cancellableSet)
    }
}
