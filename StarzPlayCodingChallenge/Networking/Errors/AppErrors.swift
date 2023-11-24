//
//  AppErrors.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation


let UNKNOWN_ERROR_MESSAGE = "The operation could not be completed. Please try again later."
enum AppError: Error {
//    case serverError(Error)
    case apiError(ApiErrorResponseModel)
    case unexpectedResponse
    case unknown
}

extension AppError: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
//        case .serverError(let afError):
//            return afError.localizedDescription
        case .unexpectedResponse:
            return "Unexpected Response From Server"
        case .unknown:
            return UNKNOWN_ERROR_MESSAGE
        case .apiError(let apiErrorResponse):
            return apiErrorResponse.errorMessage
        }
    }
}
