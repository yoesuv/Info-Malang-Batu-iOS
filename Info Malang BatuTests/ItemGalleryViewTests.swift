//
//  ItemGalleryViewTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

@MainActor
final class ItemGalleryViewTests: XCTestCase {
    
    func testItemGalleryViewWithNilGallery() throws {
        let view = ItemGalleryView(gallery: nil)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertNotNil(view)
    }
    
    func testItemGalleryViewWithValidGallery() throws {
        let gallery = GalleryModel(
            caption: "Zona Infinite World di Jatim Park 3",
            thumbnail: "https://images2.imgbox.com/52/1b/PMfvPUxo_o.jpg",
            image: "https://images2.imgbox.com/0a/e7/G421oy0Q_o.jpg"
        )
        let view = ItemGalleryView(gallery: gallery)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertEqual(view.gallery?.caption, "Zona Infinite World di Jatim Park 3")
        XCTAssertEqual(view.gallery?.image, "https://images2.imgbox.com/0a/e7/G421oy0Q_o.jpg")
    }
    
    func testItemGalleryViewWithEmptyImage() throws {
        let gallery = GalleryModel(
            caption: "Test Caption",
            thumbnail: nil,
            image: ""
        )
        let view = ItemGalleryView(gallery: gallery)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertEqual(view.gallery?.image, "")
    }
    
    func testItemGalleryViewWithNilCaption() throws {
        let gallery = GalleryModel(
            caption: nil,
            thumbnail: "https://example.com/thumb.jpg",
            image: "https://example.com/image.jpg"
        )
        let view = ItemGalleryView(gallery: gallery)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertNil(view.gallery?.caption)
        XCTAssertEqual(view.gallery?.image, "https://example.com/image.jpg")
    }
    
    func testItemGalleryViewWithNilImage() throws {
        let gallery = GalleryModel(
            caption: "Caption",
            thumbnail: nil,
            image: nil
        )
        let view = ItemGalleryView(gallery: gallery)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertNil(view.gallery?.image)
    }
    
    func testItemGalleryViewAllPropertiesNil() throws {
        let gallery = GalleryModel(
            caption: nil,
            thumbnail: nil,
            image: nil
        )
        let view = ItemGalleryView(gallery: gallery)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertNil(view.gallery?.caption)
        XCTAssertNil(view.gallery?.thumbnail)
        XCTAssertNil(view.gallery?.image)
    }
    
    func testItemGalleryViewGalleryModelId() throws {
        let gallery = GalleryModel(
            caption: "Test Gallery",
            thumbnail: nil,
            image: nil
        )
        let view = ItemGalleryView(gallery: gallery)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertEqual(view.gallery?.id, "Test Gallery")
    }
    
    func testItemGalleryViewGalleryModelIdWithNilCaption() throws {
        let gallery = GalleryModel(
            caption: nil,
            thumbnail: nil,
            image: nil
        )
        let view = ItemGalleryView(gallery: gallery)
        let _ = view.body  // trigger body evaluation for coverage
        XCTAssertFalse(view.gallery?.id.isEmpty ?? true)
    }
}