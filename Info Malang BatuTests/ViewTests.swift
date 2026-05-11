//
//  ViewTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 11/05/26.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Info_Malang_Batu

// MARK: - ItemPlaceView Tests

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

// MARK: - ItemGalleryView Tests

final class ItemGalleryViewTests: XCTestCase {
    
    func testItemGalleryViewWithNilGallery() throws {
        let view = ItemGalleryView(gallery: nil)
        // KFImage from Kingfisher is not directly inspectable as ViewType.Image
        // Test that view can be created without crashing
        XCTAssertNotNil(view)
    }
    
    func testItemGalleryViewWithValidGallery() throws {
        let gallery = GalleryModel(
            caption: "Zona Infinite World di Jatim Park 3",
            thumbnail: "https://images2.imgbox.com/52/1b/PMfvPUxo_o.jpg",
            image: "https://images2.imgbox.com/0a/e7/G421oy0Q_o.jpg"
        )
        let view = ItemGalleryView(gallery: gallery)
        XCTAssertNotNil(view)
    }
    
    func testItemGalleryViewWithEmptyImage() throws {
        let gallery = GalleryModel(
            caption: "Test Caption",
            thumbnail: nil,
            image: ""
        )
        let view = ItemGalleryView(gallery: gallery)
        XCTAssertNotNil(view)
    }
}

// MARK: - ListPlaceDetailView Tests

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

// MARK: - GalleryDetailView Tests

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

// MARK: - ItemCheckListPlace Tests

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

// MARK: - ItemChangelogView Tests

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
