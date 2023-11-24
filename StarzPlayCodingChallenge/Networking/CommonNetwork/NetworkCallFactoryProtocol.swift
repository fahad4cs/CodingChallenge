//
//  NetworkCallFactoryProtocol.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

/**  NetworkCallFactoryProtocol : protocol network calls **/
protocol NetworkCallFactoryProtocol {
    associatedtype Network
    func createNetworkCall() -> Network
    func createNetworkCall(with interceptor: OAuthValidationRequestInterceptorProtocol) -> Network
}
