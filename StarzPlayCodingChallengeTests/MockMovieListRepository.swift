//
//  MockMovieListRepository.swift
//  StarzPlayCodingChallengeTests
//
//  Created by Ahmad Qasim on 11/24/23.
//

import Foundation
@testable import StarzPlayCodingChallenge 
class MockMovieListRepository: MovieListRepository {

    var mockMovieListResponse: MovieListResponnseModel?
    var mockSeasonDetailResponse: SeasonDetailResponseModel?
    var mockError: AppError?

    func getMovieList(requestModel: MovieListRequestModel, completion: @escaping (MovieListResponnseModel) -> Void, errorHandler: @escaping (AppError) -> Void) {
        if let response = mockMovieListResponse {
            completion(response)
        } else if let error = mockError {
            errorHandler(error)
        }
    }

    func getSeasonDetail(requestModel: SeasonDetailRequestModel, completion: @escaping (SeasonDetailResponseModel) -> Void, errorHandler: @escaping (AppError) -> Void) {
        if let response = mockSeasonDetailResponse {
            completion(response)
        } else if let error = mockError {
            errorHandler(error)
        }
    }
}
