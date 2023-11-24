//
//  HTTPMethod.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

typealias HttpHeaders = [String: String]
typealias Parameters = [String: Any]

enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete
}

enum RequestEncoding {
    case url
    case json
}
