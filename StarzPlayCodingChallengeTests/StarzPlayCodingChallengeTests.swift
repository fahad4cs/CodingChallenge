//
//  StarzPlayCodingChallengeTests.swift
//  StarzPlayCodingChallengeTests
//
//  Created by Apple on 24/11/2023.
//

import XCTest
@testable import StarzPlayCodingChallenge

class TvShowDetailsVCTests: XCTestCase {

    var sut: TvShowDetailsVC!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "TvShowDetailsVC") as? TvShowDetailsVC
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerHasAllOutletsConnected() {
        XCTAssertNotNil(sut.imgPoster)
        XCTAssertNotNil(sut.lblSaesonTitle)
        XCTAssertNotNil(sut.lblSaesonSubTitle)
        XCTAssertNotNil(sut.lblDescription)
        XCTAssertNotNil(sut.collectionSeason)
        XCTAssertNotNil(sut.tblEpisodes)
    }

    func testViewModelInitialization() {
        XCTAssertNotNil(sut.viewModel)
    }

    func testApiDataFetch() {
        let authInterceptor = OAuthValidationRequestInterceptor(with: InternalOAuthAuthenticator())
        let networkCall = NetworkCallFactory().createNetworkCall(with: authInterceptor)
        let jsonParser = JsonParser()
        // Mock the viewModel and repository to test API data fetching
        let mockRepository = MockMovieListRepository(network: networkCall, parser: jsonParser)
        let mockViewModel = MovieListVM(movieListRepository: mockRepository)
        sut.viewModel = mockViewModel

        // Trigger the API call
        sut.getApiData()

        // You can use XCTest expectations here to wait for the API call completion and then assert the results
        // For simplicity, I'm assuming that your API call is asynchronous
        // XCTAssertEqual or XCTAssertNil can be used based on your actual API response
    }

    // Add more test cases based on your specific requirements
}
