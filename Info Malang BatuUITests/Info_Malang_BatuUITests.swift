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
        
        app.swipeUp()
        app.swipeUp()
        
        // tap gallery
        let gallery = app.tabBars.buttons["Gallery"]
        XCTAssertTrue(gallery.waitForExistence(timeout: timeOut))
        gallery.tap()
        sleep(1)
        
        app.swipeUp()
        app.swipeDown()
        
        // tap list place
        let listPlace = app.tabBars.buttons["List Place"]
        XCTAssertTrue(listPlace.waitForExistence(timeout: timeOut))
        listPlace.tap()
        sleep(3)
        
        // tap about
        let about = app.tabBars.buttons["About"]
        XCTAssertTrue(about.waitForExistence(timeout: timeOut))
        about.tap()
        sleep(2)
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeRight()
        app.swipeRight()
        sleep(2)
        
        let maps = app.tabBars.buttons["Maps"]
        XCTAssertTrue(maps.waitForExistence(timeout: timeOut))
        maps.tap()
        sleep(2)
        
        // allow location permission
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        let buttonAllow = springboard.buttons["Allow While Using App"]
        if buttonAllow.exists {
            buttonAllow.tap()
        }
        sleep(3)
        
    }

}
