//
//  ItemPlaceViewTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

final class ItemPlaceViewTests: XCTestCase {
    
    func testItemPlaceViewWithNilPlace() throws {
        let view = ItemPlaceView(place: nil)
        
        let nama = try view.inspect().find(text: "")
        XCTAssertNotNil(nama)
    }
    
    func testItemPlaceViewWithValidPlace() throws {
        let place = PlaceModel(
            nama: "Alun Alun Malang",
            lokasi: "Kota Malang",
            deskripsi: "Taman kota",
            thumbnail: "https://example.com/thumb.jpg",
            gambar: "https://example.com/image.jpg"
        )
        let view = ItemPlaceView(place: place)
        
        let nama = try view.inspect().find(text: "Alun Alun Malang")
        XCTAssertNotNil(nama)
        
        let lokasi = try view.inspect().find(text: "Kota Malang")
        XCTAssertNotNil(lokasi)
    }
    
    func testItemPlaceViewHeight() throws {
        let place = PlaceModel(
            nama: "Test Place",
            lokasi: "Test Lokasi",
            deskripsi: nil,
            thumbnail: nil,
            gambar: nil
        )
        let view = ItemPlaceView(place: place)
        
        let geometryReader = try view.inspect().geometryReader()
        XCTAssertNotNil(geometryReader)
    }
    
    func testItemPlaceViewTextStyle() throws {
        let place = PlaceModel(
            nama: "Jatim Park 3",
            lokasi: "Kota Batu",
            deskripsi: nil,
            thumbnail: nil,
            gambar: nil
        )
        let view = ItemPlaceView(place: place)
        
        let namaText = try view.inspect().find(text: "Jatim Park 3")
        let font = try namaText.attributes().font()
        XCTAssertEqual(font, .title3)
        
        let lokasiText = try view.inspect().find(text: "Kota Batu")
        let lokasiFont = try lokasiText.attributes().font()
        XCTAssertEqual(lokasiFont, .body)
    }
}
