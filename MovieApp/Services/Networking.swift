//
//  Networking.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation
import Alamofire
import Combine

class Networking  {
    
    static let shared = Networking()
   
    func makeRequest(url: String, method: HTTPMethod?, parameters: Parameters?, headers: HTTPHeaders?) -> AnyPublisher<SearchMovieModel, Error> {
        return AF.request(url, parameters: parameters, headers: headers)
            .publishDecodable(type: SearchMovieModel.self)
            .value()
            .mapError({$0})
            .eraseToAnyPublisher()
    }
}
