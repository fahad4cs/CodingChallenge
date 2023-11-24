//
//  StarzPlayCodingChallengeUITests.swift
//  StarzPlayCodingChallengeUITests
//
//  Created by Apple on 24/11/2023.
//

import XCTest

final class StarzPlayCodingChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

import XCTest

class TvShowDetailsVCUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testUIElementsExist() {
        
        let tvShowDetailsVC = app.otherElements["StarzPlayCodingChallenge.TvShowDetailsVC"]

        XCTAssertTrue(tvShowDetailsVC.exists, "TvShowDetailsVC should be on screen")

        // Check existence of important UI elements
        XCTAssert(app.images["imgPoster"].exists, "Image Poster should exist")
        XCTAssert(app.staticTexts["lblSaesonTitle"].exists, "Season Title label should exist")
        XCTAssert(app.staticTexts["lblSaesonSubTitle"].exists, "Season Sub Title label should exist")
        XCTAssert(app.staticTexts["lblDescription"].exists, "Description label should exist")
        XCTAssert(app.collectionViews["collectionSeason"].exists, "Season CollectionView should exist")
        XCTAssert(app.tables["tblEpisodes"].exists, "Episodes TableView should exist")
    }

    func testPlayButtonAction() {
        app.buttons["playButton"].tap()

        // Use XCTAssert statements to verify that the expected behavior occurred
        XCTAssert(app.otherElements["playerView"].exists, "Video player should be presented")
    }

    // Add more UI test cases based on your specific requirements

    override func tearDown() {
        super.tearDown()
    }
}

