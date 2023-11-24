//
//  MovieListViewModel.swift
//  CodingChallenge
//
//  Created by Apple on 22/11/2023.
//


import Foundation
import Combine
import AuthenticationServices

enum ActionTag: Int {
    case play = 0
    case trailer = 1
    case watchlist = 2
    case likeIt = 3
    case dontLike = 4
    case back = 5
    case cast = 6
    // Add more cases for additional buttons
    
    // You can also add associated values or functions as needed
    var description: String {
        switch self {
        case .play:
            return "Play"
        case .trailer:
            return "Trailer"
        case .watchlist:
            return "Watchlist"
        case .likeIt:
            return "Like It"
        case .dontLike:
            return "Don't Like it"
        case .back:
            return "Back"
        case .cast:
            return "Cast"
        // Add descriptions for additional buttons
        }
    }
}

final class MovieListVM {

    // MARK: - Data members
    @Published var apiError: AppError?
    @Published var navigateToHome: Bool = false
    @Published var showSpinner: Bool = true
    @Published var isSeasonDetail: Bool = false
    @Published var listModel: MovieListResponnseModel?
    
    private let movieListRepository: MovieListRepository
    var selectedSeasonEpisodesCount:Int = 0
    var seasonDetailList: SeasonDetailResponseModel?

    // MARK: - Initializers
    init(movieListRepository: MovieListRepository) {
        self.movieListRepository = movieListRepository
    }

    
    func getData() {
        showSpinner = true
        let listRequest: MovieListRequestModel = MovieListRequestModel(api_key: "ecef14eac236a5d4ec6ac3a4a4761e8f")
        
        movieListRepository.getMovieList(requestModel: listRequest) { [unowned self] model in
            showSpinner = false
            print(model)
            listModel = model
            self.getSeasonDetail(seasonNum: 1)
//            navigateToHome = loginModel?.data?[0].isVerified ?? false
        } errorHandler: { [unowned self] error in
            showSpinner = false
            apiError = error
        }
    }
    func getSeasonDetail(seasonNum:Int) {
        print(">>>>>>> \(seasonNum)")
        showSpinner = true
        
        let seasonListRequest: SeasonDetailRequestModel = SeasonDetailRequestModel(seriesId: "62852", api_key: "ecef14eac236a5d4ec6ac3a4a4761e8f", seasonNum: "\(seasonNum)")
        movieListRepository.getSeasonDetail(requestModel: seasonListRequest) { [unowned self] model in
            showSpinner = false
            
            print(model)
            isSeasonDetail = true
            self.seasonDetailList = model

        } errorHandler: { [unowned self] error in
            showSpinner = false
            isSeasonDetail = false
            apiError = error
        }
    }
}
