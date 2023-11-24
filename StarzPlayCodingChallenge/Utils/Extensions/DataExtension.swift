//
//  DataExtension.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//


import UIKit

// ----------------------------------------------------------------------------------
// MARK: - UIData extension
// ----------------------------------------------------------------------------------

extension Data {

    var hexString: String {
            let hexString = map { String(format: "%02.2hhx", $0) }.joined()
            return hexString
        }

    // MARK: - Decode JSON to Swift
    func decode<T: Decodable>(into: T.Type) -> T? {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: self)
        return model
    }

    // MARK: - Encode Swift to data
    func encode<T: Encodable>(from model: T) -> Data? {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(model)
        return data
    }
}
