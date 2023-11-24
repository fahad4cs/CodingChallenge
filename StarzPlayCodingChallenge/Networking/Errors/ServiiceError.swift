//
//  ServiiceError.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

/**  ServiceError : enums for errors   **/
public enum ServiceError<E: Error>: Error, Hashable where E: CustomDebugStringConvertible & Hashable {
    case unknown
    case connection(URLError)
    case url(URLError)
    case endpoint(E)

    public init(error: Error?) {
        let connectionErrorCodes: [URLError.Code] = [.timedOut,
                                                     .notConnectedToInternet,
                                                     .cannotFindHost,
                                                     .cannotConnectToHost,
                                                     .cannotLoadFromNetwork,
                                                     .backgroundSessionWasDisconnected,
                                                     .secureConnectionFailed,
                                                     .networkConnectionLost,
                                                     .dnsLookupFailed,
                                                     .internationalRoamingOff]

        let domain: ServiceError
        switch error {
        case let error as URLError:
            if connectionErrorCodes .contains(error.code) {
                domain = .connection(error)
            } else {
                domain = .url(error)
            }

        case let error as E:
            domain = .endpoint(error)

        default:
            domain = .unknown
        }

        self = domain
    }
}
