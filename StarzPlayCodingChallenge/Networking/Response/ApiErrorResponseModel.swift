//
//  ApiErrorResponseModel.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

/**  ApiErrorResponseModel : response handler  **/
struct ApiErrorResponseModel: Decodable {
    var error, error_description, message: String?
    var statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case error
        case error_description
        case message
        case statusCode
    }

    var errorMessage: String {
        return error_description ?? message ?? UNKNOWN_ERROR_MESSAGE
    }
}
