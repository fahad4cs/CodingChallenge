//
//  RepositoryFactoryProtocol.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

import UIKit

protocol RepositoryFactoryProtocol {
    associatedtype Repository
    func createRepository(network: NetworkCallProtocol, parser: Parser) -> Repository
}
