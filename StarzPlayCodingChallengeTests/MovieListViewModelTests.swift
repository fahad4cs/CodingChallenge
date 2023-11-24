//
//  MovieListViewModelTests.swift
//  StarzPlayCodingChallengeTests
//
//  Created by Ahmad Qasim on 11/24/23.
//



import XCTest
@testable import StarzPlayCodingChallenge

class MovieListVMTests: XCTestCase {

    var sut: MovieListVM!
    var mockRepository: MockMovieListRepository!

    
    override func setUp() {
        super.setUp()
        let authInterceptor = OAuthValidationRequestInterceptor(with: InternalOAuthAuthenticator())
        let networkCall = NetworkCallFactory().createNetworkCall(with: authInterceptor)
        let jsonParser = JsonParser()
        mockRepository = MockMovieListRepository(network: networkCall, parser: jsonParser)
        sut = MovieListVM(movieListRepository: mockRepository)
    }

    override func tearDown() {
        sut = nil
        mockRepository = nil
        super.tearDown()
    }

    func testGetData() {
        // Mock the repository to simulate a successful API call
        mockRepository.mockMovieListResponse = MovieListResponnseModel(/* provide necessary properties */)
        sut.getData()
 }
    func testGetMovieListSuccess() {
         mockRepository.mockMovieListResponse = MovieListResponnseModel(/* provide necessary properties */)
         sut.getData()

         // Use XCTest expectations to wait for the API call completion and assert the results
         let expectation = XCTestExpectation(description: "Wait for API call completion")
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
             // Assert your expectations here based on the success scenario
             expectation.fulfill()
         }
         wait(for: [expectation], timeout: 5)
     }
    
    func testGetMovieListWithError() {
         mockRepository.mockError = AppError(message: "Some error message")
         sut.getData()

         // Use XCTest expectations to wait for the API call completion and assert the results
         let expectation = XCTestExpectation(description: "Wait for API call completion")
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
             // Assert your expectations here based on the error scenario
             expectation.fulfill()
         }
         wait(for: [expectation], timeout: 5)
     }


    func testGetSeasonDetail() {
        // Mock the repository to simulate a successful API call
        mockRepository.mockSeasonDetailResponse = SeasonDetailResponseModel(/* provide necessary properties */)
        sut.getSeasonDetail(seasonNum: 1)

    }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

struct AppError: Error {
    let message: String

    init(message: String) {
        self.message = message
    }
}
