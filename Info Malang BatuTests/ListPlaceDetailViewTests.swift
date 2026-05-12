//
//  ListPlaceDetailViewTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

final class ListPlaceDetailViewTests: XCTestCase {
    
    func testListPlaceDetailViewWithNilPlace() throws {
        let view = ListPlaceDetailView(place: nil)
        
        let nama = try view.inspect().find(text: "")
        XCTAssertNotNil(nama)
    }
    
    func testListPlaceDetailViewWithValidPlace() throws {
        let place = PlaceModel(
            nama: "Alun Alun Malang",
            lokasi: "Kota Malang",
            deskripsi: "Taman kota yang luas",
            thumbnail: "https://example.com/thumb.jpg",
            gambar: "https://example.com/image.jpg"
        )
        let view = ListPlaceDetailView(place: place)
        
        let nama = try view.inspect().find(text: "Alun Alun Malang")
        XCTAssertNotNil(nama)
        
        let deskripsi = try view.inspect().find(text: "Taman kota yang luas")
        XCTAssertNotNil(deskripsi)
    }
    
    func testListPlaceDetailViewTextStyles() throws {
        let place = PlaceModel(
            nama: "Jatim Park 3",
            lokasi: "Kota Batu",
            deskripsi: "Tempat wisata edukasi",
            thumbnail: nil,
            gambar: nil
        )
        let view = ListPlaceDetailView(place: place)
        
        let namaText = try view.inspect().find(text: "Jatim Park 3")
        let namaFont = try namaText.attributes().font()
        XCTAssertEqual(namaFont, .body)
        
        let deskripsiText = try view.inspect().find(text: "Tempat wisata edukasi")
        let deskripsiFont = try deskripsiText.attributes().font()
        XCTAssertEqual(deskripsiFont, .callout)
    }
    
    func testListPlaceDetailViewGeometryReader() throws {
        let place = PlaceModel(
            nama: "Test",
            lokasi: nil,
            deskripsi: nil,
            thumbnail: nil,
            gambar: nil
        )
        let view = ListPlaceDetailView(place: place)
        
        let geoReader = try view.inspect().geometryReader()
        XCTAssertNotNil(geoReader)
    }
}
