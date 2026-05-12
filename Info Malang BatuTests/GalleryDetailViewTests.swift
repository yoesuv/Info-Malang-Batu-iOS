//
//  GalleryDetailViewTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

final class GalleryDetailViewTests: XCTestCase {
    
    func testGalleryDetailViewWithNilGallery() throws {
        let view = GalleryDetailView(gallery: nil)
        
        let caption = try view.inspect().find(text: "")
        XCTAssertNotNil(caption)
    }
    
    func testGalleryDetailViewWithValidGallery() throws {
        let gallery = GalleryModel(
            caption: "Zona Infinite World di Jatim Park 3",
            thumbnail: "https://images2.imgbox.com/52/1b/PMfvPUxo_o.jpg",
            image: "https://images2.imgbox.com/0a/e7/G421oy0Q_o.jpg"
        )
        let view = GalleryDetailView(gallery: gallery)
        
        let caption = try view.inspect().find(text: "Zona Infinite World di Jatim Park 3")
        XCTAssertNotNil(caption)
    }
    
    func testGalleryDetailViewCaptionStyle() throws {
        let gallery = GalleryModel(
            caption: "Jatim Park 3",
            thumbnail: nil,
            image: nil
        )
        let view = GalleryDetailView(gallery: gallery)
        
        let captionText = try view.inspect().find(text: "Jatim Park 3")
        let font = try captionText.attributes().font()
        XCTAssertEqual(font, .callout)
    }
    
    func testGalleryDetailViewGeometryReader() throws {
        let gallery = GalleryModel(
            caption: "Test",
            thumbnail: nil,
            image: nil
        )
        let view = GalleryDetailView(gallery: gallery)
        
        let geoReader = try view.inspect().geometryReader()
        XCTAssertNotNil(geoReader)
    }
}
