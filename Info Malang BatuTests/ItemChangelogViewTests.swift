//
//  ItemChangelogViewTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

final class ItemChangelogViewTests: XCTestCase {
    
    func testItemChangelogViewWithNilChangelog() throws {
        let view = ItemChangelogView(changelog: nil)
        
        let versionText = try view.inspect().find(text: "")
        XCTAssertNotNil(versionText)
    }
    
    func testItemChangelogViewWithValidChangelog() throws {
        let changelog = ChangelogModel(
            version: "v1.0.0",
            information: "<p>Initial release</p>"
        )
        let view = ItemChangelogView(changelog: changelog)
        
        let versionText = try view.inspect().find(text: "v1.0.0")
        XCTAssertNotNil(versionText)
    }
    
    func testItemChangelogViewVersionStyle() throws {
        let changelog = ChangelogModel(
            version: "v2.1.0",
            information: "<p>Bug fixes</p>"
        )
        let view = ItemChangelogView(changelog: changelog)
        
        let versionText = try view.inspect().find(text: "v2.1.0")
        let font = try versionText.attributes().font()
        XCTAssertEqual(font, .body)
    }
    
    func testItemChangelogViewVStackLayout() throws {
        let changelog = ChangelogModel(
            version: "v1.5.0",
            information: "<p>New features</p>"
        )
        let view = ItemChangelogView(changelog: changelog)
        
        let vstack = try view.inspect().vStack()
        XCTAssertNotNil(vstack)
    }
    
    func testItemChangelogViewHasDivider() throws {
        let changelog = ChangelogModel(
            version: "v3.0.0",
            information: "<p>Major update</p>"
        )
        let view = ItemChangelogView(changelog: changelog)
        
        let divider = try view.inspect().find(ViewType.Divider.self)
        XCTAssertNotNil(divider)
    }
}
