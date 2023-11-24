//
//  Error.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//


import Foundation

/**  ApiError : enums for errors   **/
enum ApiError: LocalizedError {
    case dataNotFound
    case badRequest
    case unAuthorized
    case invalidResponse
    case errorMsg
    case noInternet
    case unKnown
    case rewardFetchError
}

extension ApiError {
    var errorDescription: String? {
            switch self {
            case .dataNotFound:
                return DATA_NNOT_FOUND

            case .badRequest:
                return BAD_REQUEST

            case .unAuthorized:
                return UN_AUTHORIZED

            case .invalidResponse:
                return INVALID_RESPONSE

            case .errorMsg:
                return ERROR_MSG
                
            case .noInternet:
                return NO_INTERNET

            case .unKnown:
                return UNKNOWN

            case .rewardFetchError:
                return REWARD_FETCH_ERROR
        }
    }
}
