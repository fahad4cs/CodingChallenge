//
//  NetworkCallFactory.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

/**  NetworkCallFactory : class  for NetworkCalls  **/
final class NetworkCallFactory {
}

extension NetworkCallFactory: NetworkCallFactoryProtocol {
    func createNetworkCall() -> NetworkCallProtocol {
        return NetworkCall()
    }

    func createNetworkCall(with interceptor: OAuthValidationRequestInterceptorProtocol) -> NetworkCallProtocol {
        return NetworkCall(interceptor: interceptor)
    }
}
