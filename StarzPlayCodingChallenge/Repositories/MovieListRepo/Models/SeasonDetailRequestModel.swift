//
//  SeasonDetailRequestModel.swift
//  CodingChallenge
//
//  Created by Apple on 23/11/2023.
//

import Foundation

struct SeasonDetailRequestModel: Codable {
    
    var seriesId: String?
    var api_key: String?
    var seasonNum: String?
}
