//
//  SeasonDetailResponceModel.swift
//  CodingChallenge
//
//  Created by Apple on 23/11/2023.
//




import Foundation

// MARK: - SeasonDetailResponseModel
struct SeasonDetailResponseModel: Codable {
    var id: String?
    var airDate: String?
    var episodes: [Episode]?
    var name: String?
    var overview: String?
    var seasonDetailResponseModelID: Int?
    var posterPath: String?
    var seasonNumber: Int?
    var voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case airDate = "air_date"
        case episodes = "episodes"
        case name = "name"
        case overview = "overview"
        case seasonDetailResponseModelID = "id"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
    }
}

// MARK: - Episode
struct Episode: Codable {
    var airDate: String?
    var episodeNumber: Int?
    var episodeType: EpisodeType?
    var id: Int?
    var name: String?
    var overview: String?
    var productionCode: String?
    var runtime: Int?
    var seasonNumber: Int?
    var showID: Int?
    var stillPath: String?
    var voteAverage: Double?
    var voteCount: Int?
    var crew: [Crew]?
    var guestStars: [Crew]?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case episodeType = "episode_type"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case productionCode = "production_code"
        case runtime = "runtime"
        case seasonNumber = "season_number"
        case showID = "show_id"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case crew = "crew"
        case guestStars = "guest_stars"
    }
}

// MARK: - Crew
struct Crew: Codable {
    var job: String?
    var department: Department?
    var creditID: String?
    var adult: Bool?
    var gender: Int?
    var id: Int?
    var knownForDepartment: String?
    var name: String?
    var originalName: String?
    var popularity: Double?
    var profilePath: String?
    var character: String?
    var order: Int?

    enum CodingKeys: String, CodingKey {
        case job = "job"
        case department = "department"
        case creditID = "credit_id"
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case character = "character"
        case order = "order"
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case production = "Production"
    case writing = "Writing"
}

enum EpisodeType: String, Codable {
    case finale = "finale"
    case standard = "standard"
    case midSeason = "mid_season"
}
