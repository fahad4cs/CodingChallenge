//
//  MovieListRequest.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/2023.
//

import Foundation

struct MovieListRequest: RequestProtocol {
    typealias Response = MovieListResponnseModel
    typealias ErrorType = AppError
    var method: HTTPMethod = .get
    var path: String = ServerUrl.EndPoint.tvShowDetail.rawValue
    var parameters: Parameters?
    var encoding: RequestEncoding = .url
//    var headers: HttpHeaders? {
//        return ["Content-Type": APP_JSON]
//    }
}



struct SeasonDetailRequest: RequestProtocol {
    typealias Response = SeasonDetailResponseModel
    typealias ErrorType = AppError
    var method: HTTPMethod = .get
    var path: String {
        return String(format: ServerUrl.EndPoint.seasonDetail.rawValue + seriesNum + "/season/" + seasonNum)
    }
    
    var parameters: Parameters?
    var encoding: RequestEncoding = .url
    var seriesNum: String
    var seasonNum: String

}
