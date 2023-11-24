//
//  ServerUrl.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

/**  ServerUrl : class  all the URL's and end points **/
final class ServerUrl {
    //API Key =  ecef14eac236a5d4ec6ac3a4a4761e8f
    static var stagingUrl: String = "https://api.themoviedb.org/3" /**  stagingUrl : static  base URL generic **/
    static var stagingImageUrl: String = "https://image.tmdb.org/t/p/w500/" /**  stagingUrl : static  base URL for image's its seprate **/
    static var video: String = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" /**  video : static  base URL for video's **/

    
    enum EndPoint: String {
        
        case tvShowDetail = "/tv/62852"
        case seasonDetail = "/tv/"
        case episodeDetail = "/tv-episodes/get-tv-episode-details"
        
    }
}

//https://api.themoviedb.org/3/tv/62852?api_key=ecef14eac236a5d4ec6ac3a4a4761e8f
