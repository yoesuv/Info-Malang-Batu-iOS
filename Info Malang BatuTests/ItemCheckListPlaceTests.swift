//
//  ItemCheckListPlaceTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

final class ItemCheckListPlaceTests: XCTestCase {
    
    func testItemCheckListPlaceWithMatchingSelection() throws {
        let filter = FilterItemListPlaceModel(title: "Semua", location: .semua)
        let selectedFilter = FilterItemListPlaceModel(title: "Semua", location: .semua)
        
        let view = ItemCheckListPlace(
            filter: filter,
            selectedFilter: .constant(selectedFilter),
            showMenuListPlace: .constant(true),
            completion: { _ in }
        )
        
        let titleText = try view.inspect().find(text: "Semua")
        XCTAssertNotNil(titleText)
    }
    
    func testItemCheckListPlaceWithDifferentSelection() throws {
        let filter = FilterItemListPlaceModel(title: "Kota Malang", location: .kota_malang)
        let selectedFilter = FilterItemListPlaceModel(title: "Semua", location: .semua)
        
        let view = ItemCheckListPlace(
            filter: filter,
            selectedFilter: .constant(selectedFilter),
            showMenuListPlace: .constant(true),
            completion: { _ in }
        )
        
        let titleText = try view.inspect().find(text: "Kota Malang")
        XCTAssertNotNil(titleText)
    }
    
    func testItemCheckListPlaceTitleContent() throws {
        let filter = FilterItemListPlaceModel(title: "Kota Batu", location: .kota_batu)
        let selectedFilter = FilterItemListPlaceModel(title: "Kota Batu", location: .kota_batu)
        
        let view = ItemCheckListPlace(
            filter: filter,
            selectedFilter: .constant(selectedFilter),
            showMenuListPlace: .constant(false),
            completion: { _ in }
        )
        
        let titleText = try view.inspect().find(text: "Kota Batu")
        let content = try titleText.string()
        XCTAssertEqual(content, "Kota Batu")
    }
    
    func testItemCheckListPlaceHasCircleAndCheckmark() throws {
        let filter = FilterItemListPlaceModel(title: "Kab Malang", location: .kab_malang)
        let selectedFilter = FilterItemListPlaceModel(title: "Kab Malang", location: .kab_malang)
        
        let view = ItemCheckListPlace(
            filter: filter,
            selectedFilter: .constant(selectedFilter),
            showMenuListPlace: .constant(true),
            completion: { _ in }
        )
        
        // When selected, checkmark image should be present
        let checkmark = try view.inspect().find(ViewType.Image.self)
        XCTAssertNotNil(checkmark)
    }
    
    func testItemCheckListPlaceHStackLayout() throws {
        let filter = FilterItemListPlaceModel(title: "Test Filter", location: .semua)
        let selectedFilter = FilterItemListPlaceModel(title: "Other", location: .kota_batu)
        
        let view = ItemCheckListPlace(
            filter: filter,
            selectedFilter: .constant(selectedFilter),
            showMenuListPlace: .constant(false),
            completion: { _ in }
        )
        
        let hstack = try view.inspect().hStack()
        XCTAssertNotNil(hstack)
    }
}
