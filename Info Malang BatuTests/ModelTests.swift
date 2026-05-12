//
//  ModelTests.swift
//  Info Malang BatuTests
//
//  Created by opencode on 12/05/26.
//

import XCTest
@testable import Info_Malang_Batu

// MARK: - GalleryModel Tests

final class GalleryModelTests: XCTestCase {

    func testGalleryModelIdWithCaption() {
        let gallery = GalleryModel(
            caption: "Zona Infinite World",
            thumbnail: "https://example.com/thumb.jpg",
            image: "https://example.com/image.jpg"
        )
        XCTAssertEqual(gallery.id, "Zona Infinite World")
    }

    func testGalleryModelIdWithNilCaption() throws {
        let gallery = GalleryModel(
            caption: nil,
            thumbnail: "https://example.com/thumb.jpg",
            image: "https://example.com/image.jpg"
        )
        // When caption is nil, id should be a UUID string (non-empty)
        XCTAssertFalse(gallery.id.isEmpty)
        // UUID format: 8-4-4-4-12 characters
        let uuidPattern = "^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$"
        let regex = try NSRegularExpression(pattern: uuidPattern)
        let range = NSRange(location: 0, length: gallery.id.utf16.count)
        XCTAssertNotNil(regex.firstMatch(in: gallery.id, options: [], range: range))
    }

    func testGalleryModelProperties() {
        let gallery = GalleryModel(
            caption: "Test Caption",
            thumbnail: "https://example.com/thumb.jpg",
            image: "https://example.com/image.jpg"
        )
        XCTAssertEqual(gallery.caption, "Test Caption")
        XCTAssertEqual(gallery.thumbnail, "https://example.com/thumb.jpg")
        XCTAssertEqual(gallery.image, "https://example.com/image.jpg")
    }

    func testGalleryModelNilProperties() {
        let gallery = GalleryModel(
            caption: nil,
            thumbnail: nil,
            image: nil
        )
        XCTAssertNil(gallery.caption)
        XCTAssertNil(gallery.thumbnail)
        XCTAssertNil(gallery.image)
    }

    func testGalleryModelCodable() throws {
        let original = GalleryModel(
            caption: "Jatim Park 3",
            thumbnail: "https://example.com/thumb.jpg",
            image: "https://example.com/image.jpg"
        )

        let encoder = JSONEncoder()
        let data = try encoder.encode(original)

        let decoder = JSONDecoder()
        let decoded = try decoder.decode(GalleryModel.self, from: data)

        XCTAssertEqual(decoded.caption, original.caption)
        XCTAssertEqual(decoded.thumbnail, original.thumbnail)
        XCTAssertEqual(decoded.image, original.image)
        XCTAssertEqual(decoded.id, original.id)
    }

    func testGalleryModelCodableWithNils() throws {
        let original = GalleryModel(
            caption: nil,
            thumbnail: nil,
            image: nil
        )

        let encoder = JSONEncoder()
        let data = try encoder.encode(original)

        let decoder = JSONDecoder()
        let decoded = try decoder.decode(GalleryModel.self, from: data)

        XCTAssertNil(decoded.caption)
        XCTAssertNil(decoded.thumbnail)
        XCTAssertNil(decoded.image)
    }

    func testGalleryModelDecodableFromJSON() throws {
        let json = """
        {
            "caption": "Batu Night Spectacular",
            "thumbnail": "https://example.com/bns_thumb.jpg",
            "image": "https://example.com/bns.jpg"
        }
        """
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let gallery = try decoder.decode(GalleryModel.self, from: data)

        XCTAssertEqual(gallery.caption, "Batu Night Spectacular")
        XCTAssertEqual(gallery.thumbnail, "https://example.com/bns_thumb.jpg")
        XCTAssertEqual(gallery.image, "https://example.com/bns.jpg")
        XCTAssertEqual(gallery.id, "Batu Night Spectacular")
    }
}

// MARK: - PinModel Tests

final class PinModelTests: XCTestCase {

    func testPinModelIdWithName() {
        let pin = PinModel(
            name: "Alun Alun Malang",
            lokasi: 1,
            latitude: -7.982914,
            longitude: 112.630875
        )
        XCTAssertEqual(pin.id, "Alun Alun Malang")
    }

    func testPinModelIdWithNilName() throws {
        let pin = PinModel(
            name: nil,
            lokasi: 1,
            latitude: -7.982914,
            longitude: 112.630875
        )
        // When name is nil, id should be a UUID string (non-empty)
        XCTAssertFalse(pin.id.isEmpty)
        // UUID format: 8-4-4-4-12 characters
        let uuidPattern = "^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$"
        let regex = try NSRegularExpression(pattern: uuidPattern)
        let range = NSRange(location: 0, length: pin.id.utf16.count)
        XCTAssertNotNil(regex.firstMatch(in: pin.id, options: [], range: range))
    }

    func testPinModelProperties() {
        let pin = PinModel(
            name: "Alun Alun Malang",
            lokasi: 1,
            latitude: -7.982914,
            longitude: 112.630875
        )
        XCTAssertEqual(pin.name, "Alun Alun Malang")
        XCTAssertEqual(pin.lokasi, 1)
        XCTAssertEqual(pin.latitude, -7.982914)
        XCTAssertEqual(pin.longitude, 112.630875)
    }

    func testPinModelNilProperties() {
        let pin = PinModel(
            name: nil,
            lokasi: nil,
            latitude: nil,
            longitude: nil
        )
        XCTAssertNil(pin.name)
        XCTAssertNil(pin.lokasi)
        XCTAssertNil(pin.latitude)
        XCTAssertNil(pin.longitude)
    }

    func testPinModelCodable() throws {
        let original = PinModel(
            name: "Jatim Park 3",
            lokasi: 2,
            latitude: -7.888888,
            longitude: 112.525252
        )

        let encoder = JSONEncoder()
        let data = try encoder.encode(original)

        let decoder = JSONDecoder()
        let decoded = try decoder.decode(PinModel.self, from: data)

        XCTAssertEqual(decoded.name, original.name)
        XCTAssertEqual(decoded.lokasi, original.lokasi)
        XCTAssertEqual(decoded.latitude, original.latitude)
        XCTAssertEqual(decoded.longitude, original.longitude)
        XCTAssertEqual(decoded.id, original.id)
    }

    func testPinModelCodableWithNils() throws {
        let original = PinModel(
            name: nil,
            lokasi: nil,
            latitude: nil,
            longitude: nil
        )

        let encoder = JSONEncoder()
        let data = try encoder.encode(original)

        let decoder = JSONDecoder()
        let decoded = try decoder.decode(PinModel.self, from: data)

        XCTAssertNil(decoded.name)
        XCTAssertNil(decoded.lokasi)
        XCTAssertNil(decoded.latitude)
        XCTAssertNil(decoded.longitude)
    }

    func testPinModelDecodableFromJSON() throws {
        let json = """
        {
            "name": "Batu Night Spectacular",
            "lokasi": 3,
            "latitude": -7.878787,
            "longitude": 112.515151
        }
        """
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let pin = try decoder.decode(PinModel.self, from: data)

        XCTAssertEqual(pin.name, "Batu Night Spectacular")
        XCTAssertEqual(pin.lokasi, 3)
        XCTAssertEqual(pin.latitude, -7.878787)
        XCTAssertEqual(pin.longitude, 112.515151)
        XCTAssertEqual(pin.id, "Batu Night Spectacular")
    }
}

// MARK: - FilterItemListPlaceModel Tests

final class FilterItemListPlaceModelTests: XCTestCase {

    func testFilterItemListPlaceModelSemua() {
        let filter = FilterItemListPlaceModel(title: "Semua", location: .semua)
        XCTAssertEqual(filter.title, "Semua")
        XCTAssertEqual(filter.location, .semua)
        XCTAssertFalse(filter.id.isEmpty, "id should be generated")
    }

    func testFilterItemListPlaceModelKotaMalang() {
        let filter = FilterItemListPlaceModel(title: "Kota Malang", location: .kota_malang)
        XCTAssertEqual(filter.title, "Kota Malang")
        XCTAssertEqual(filter.location, .kota_malang)
        XCTAssertFalse(filter.id.isEmpty, "id should be generated")
    }

    func testFilterItemListPlaceModelKotaBatu() {
        let filter = FilterItemListPlaceModel(title: "Kota Batu", location: .kota_batu)
        XCTAssertEqual(filter.title, "Kota Batu")
        XCTAssertEqual(filter.location, .kota_batu)
        XCTAssertFalse(filter.id.isEmpty, "id should be generated")
    }

    func testFilterItemListPlaceModelKabMalang() {
        let filter = FilterItemListPlaceModel(title: "Kab Malang", location: .kab_malang)
        XCTAssertEqual(filter.title, "Kab Malang")
        XCTAssertEqual(filter.location, .kab_malang)
        XCTAssertFalse(filter.id.isEmpty, "id should be generated")
    }

    func testFilterItemListPlaceModelIdIsValidUUID() throws {
        let filter = FilterItemListPlaceModel(title: "Test", location: .semua)
        let filterId = filter.id
        XCTAssertFalse(filterId.isEmpty)
        // UUID format: 8-4-4-4-12 characters
        let uuidPattern = "^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$"
        let regex = try NSRegularExpression(pattern: uuidPattern)
        let range = NSRange(location: 0, length: filterId.utf16.count)
        XCTAssertNotNil(regex.firstMatch(in: filterId, options: [], range: range))
    }

    func testFilterItemListPlaceModelIdIsUnique() {
        let filter1 = FilterItemListPlaceModel(title: "Test", location: .semua)
        let filter2 = FilterItemListPlaceModel(title: "Test", location: .semua)
        // Each instance should have a unique id since UUID() generates a new value each time
        XCTAssertNotEqual(filter1.id, filter2.id)
    }

    func testFilterItemListPlaceModelIdentifiable() {
        let filter = FilterItemListPlaceModel(title: "Test", location: .kota_malang)
        // Verify it conforms to Identifiable by accessing id
        let id: String = filter.id
        XCTAssertFalse(id.isEmpty)
        // Verify the filter properties are accessible
        XCTAssertEqual(filter.title, "Test")
        XCTAssertEqual(filter.location, .kota_malang)
    }
}
