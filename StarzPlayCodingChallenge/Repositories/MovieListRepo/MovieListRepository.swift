//
//  MovieListRepository.swift
//  CodingChallenge
//
//  Created by Apple on 22/11/2023.
//

import Foundation

protocol MovieListRepositoryProtocol {
    func getMovieList(requestModel: MovieListRequestModel,
                   successHandler: @escaping CompletionWithSuccess<MovieListRequest.Response>,
                   errorHandler: @escaping CompletionWithServiceError)
    
    func getSeasonDetail(requestModel: SeasonDetailRequestModel,
                   successHandler: @escaping CompletionWithSuccess<SeasonDetailRequest.Response>,
                   errorHandler: @escaping CompletionWithServiceError)
}

class MovieListRepository: RepositoryProtocol {
    let network: NetworkCallProtocol
    let parser: Parser

    init(network: NetworkCallProtocol, parser: Parser) {
        self.network = network
        self.parser = parser
    }
}



// MARK: - MovieListRepository implementation
extension MovieListRepository: MovieListRepositoryProtocol {
    func getMovieList(requestModel: MovieListRequestModel,
                   successHandler: @escaping CompletionWithSuccess<MovieListRequest.Response>,
                   errorHandler: @escaping CompletionWithServiceError) {
        
        var request = MovieListRequest(parameters: requestModel.jsonDictionary)
        network.request(request) { [unowned self] result in
            switch result {
            case .success(let response):
                parseResponse(response, successHandler: successHandler, errorHandler: errorHandler)
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
    
    func getSeasonDetail(requestModel: SeasonDetailRequestModel,
                   successHandler: @escaping CompletionWithSuccess<SeasonDetailRequest.Response>,
                   errorHandler: @escaping CompletionWithServiceError) {
        
        let request = SeasonDetailRequest(parameters: requestModel.jsonDictionary, seriesNum: requestModel.seriesId!, seasonNum: requestModel.seasonNum!)
        network.request(request) { [unowned self] result in
            switch result {
            case .success(let response):
                parseResponse(response, successHandler: successHandler, errorHandler: errorHandler)
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}
