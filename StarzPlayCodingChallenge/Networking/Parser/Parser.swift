//
//  Parser.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

/**  Parser : protocol to Parse   **/
protocol Parser {
    func parseWith<T: Decodable>(data: Data, type: T.Type) -> Result<T, AppError>
}
