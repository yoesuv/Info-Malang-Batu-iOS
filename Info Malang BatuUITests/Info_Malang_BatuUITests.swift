//
//  Info_Malang_BatuUITests.swift
//  Info Malang BatuUITests
//
//  Created by Yusuf Saifudin on 17/05/24.
//

import XCTest

final class Info_Malang_BatuUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let splashText = app.staticTexts["Info Malang Batu"]
        XCTAssert(splashText.exists)
    }

    /*func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }*/
}
