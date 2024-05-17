//
//  Info_Malang_BatuUITests.swift
//  Info Malang BatuUITests
//
//  Created by Yusuf Saifudin on 17/05/24.
//

import XCTest

let timeOut = 3.0

final class Info_Malang_BatuUITests: XCTestCase {
    
    override class func setUp() {
        XCUIApplication().launch()
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}
    

    func testExample() throws {
        
        let app = XCUIApplication()
        
        let splashText = app.staticTexts["Info Malang Batu"]
        XCTAssertTrue(splashText.exists)
        
        sleep(3)
        
        let gallery = app.tabBars.buttons["Gallery"]
        XCTAssertTrue(gallery.waitForExistence(timeout: timeOut))
        gallery.tap()
        sleep(5)
        
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
