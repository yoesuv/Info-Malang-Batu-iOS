//
//  ItemLibraryViewTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 13/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

@MainActor
final class ItemLibraryViewTests: XCTestCase {
    
    func testItemLibraryViewWithNilLibrary() throws {
        let view = ItemLibraryView(library: nil)
        let _ = view.body
        
        let nameText = try view.inspect().find(text: "")
        XCTAssertNotNil(nameText)
    }
    
    func testItemLibraryViewWithValidLibrary() throws {
        let library = LibraryModel(
            name: "Kingfisher",
            url: "https://github.com/onevcat/Kingfisher",
            license: "MIT License"
        )
        let view = ItemLibraryView(library: library)
        let _ = view.body
        
        let nameText = try view.inspect().find(text: "Kingfisher")
        XCTAssertNotNil(nameText)
    }
    
    func testItemLibraryViewNameStyle() throws {
        let library = LibraryModel(
            name: "Alamofire",
            url: "https://github.com/Alamofire/Alamofire",
            license: "MIT License"
        )
        let view = ItemLibraryView(library: library)
        let _ = view.body
        
        let nameText = try view.inspect().find(text: "Alamofire")
        let font = try nameText.attributes().font()
        XCTAssertEqual(font, .title3)
    }
    
    func testItemLibraryViewUrlStyle() throws {
        let library = LibraryModel(
            name: "Kingfisher",
            url: "https://github.com/onevcat/Kingfisher",
            license: "MIT License"
        )
        let view = ItemLibraryView(library: library)
        let _ = view.body
        
        let urlText = try view.inspect().find(text: "https://github.com/onevcat/Kingfisher")
        let font = try urlText.attributes().font()
        XCTAssertEqual(font, .caption)
    }
    
    func testItemLibraryViewVStackLayout() throws {
        let library = LibraryModel(
            name: "Kingfisher",
            url: "https://github.com/onevcat/Kingfisher",
            license: "MIT License"
        )
        let view = ItemLibraryView(library: library)
        let _ = view.body
        
        let vstack = try view.inspect().vStack()
        XCTAssertNotNil(vstack)
    }
    
    func testItemLibraryViewHasDivider() throws {
        let library = LibraryModel(
            name: "Kingfisher",
            url: "https://github.com/onevcat/Kingfisher",
            license: "MIT License"
        )
        let view = ItemLibraryView(library: library)
        let _ = view.body
        
        let divider = try view.inspect().find(ViewType.Divider.self)
        XCTAssertNotNil(divider)
    }
    
    func testItemLibraryViewWithNilNameShowsEmpty() throws {
        let library = LibraryModel(
            name: "",
            url: "",
            license: ""
        )
        let view = ItemLibraryView(library: library)
        let _ = view.body
        
        let nameText = try view.inspect().find(text: "")
        XCTAssertNotNil(nameText)
    }
    
    func testItemLibraryViewNameFontWeight() throws {
        let library = LibraryModel(
            name: "Kingfisher",
            url: "https://github.com/onevcat/Kingfisher",
            license: "MIT License"
        )
        let view = ItemLibraryView(library: library)
        let _ = view.body
        
        let nameText = try view.inspect().find(text: "Kingfisher")
        let fontWeight = try nameText.attributes().fontWeight()
        XCTAssertEqual(fontWeight, .bold)
    }
}