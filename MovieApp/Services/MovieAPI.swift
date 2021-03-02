//
//  MovieAPI.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation
import Combine
import Alamofire

class MovieAPI {
    
    static let shared = MovieAPI()
    
    private let baseUrl = "https://api.themoviedb.org/3/"
    private let apiKey = "2acecb82244a02d497dc7c5aacf05014"
    
    private func absoluteURL(query: String?, page: Int?) -> URL? {
        let queryURL = URL(string: baseUrl + "search/movie?")!
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else { return nil}
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(page ?? 0))
        ]
        return urlComponents.url
    }
    
    func searchMovie( search: String, page: Int) -> AnyPublisher<SearchMovieModel, Never> {
        guard let url = absoluteURL(query: search, page: page) else {
            return Just(SearchMovieModel.placeholder)
                .eraseToAnyPublisher()
        }
        return
            URLSession.shared.dataTaskPublisher(for:url)
            .map { $0.data }
            .decode(type: SearchMovieModel.self, decoder: JSONDecoder())
            .catch { error in Just(SearchMovieModel.placeholder)}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
    func getdetailMovieInfo(movieId: Int) -> AnyPublisher<DetailMovieModel, AFError> {
        let url = "\(baseUrl)movie/\(movieId)?api_key=\(apiKey)&append_to_response=videos"
        let publisher = AF.request(url).validate().publishDecodable(type: DetailMovieModel.self)
        return publisher.value()
    }
}
