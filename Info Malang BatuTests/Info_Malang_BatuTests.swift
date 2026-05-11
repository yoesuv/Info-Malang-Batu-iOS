//
//  Info_Malang_BatuTests.swift
//  Info Malang BatuTests
//
//  Created by Yusuf Saifudin on 20/05/24.
//

import XCTest
@preconcurrency import Combine
@testable import Info_Malang_Batu

final class InfoMalangBatuTests: XCTestCase {
    
    @MainActor
    func testListGallery() {
        var cancellables = Set<AnyCancellable>()
        let expectation = expectation(description: "Galleries loaded")
        let mockService = MockNetworkService()
        let viewmodel = GalleryViewModel(mockService)
        
        viewmodel.$galleries
            .dropFirst()
            .sink { @MainActor _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewmodel.fetchGalleries()
        
        waitForExpectations(timeout: 1)
        XCTAssertEqual(viewmodel.galleries.count, 3)
        XCTAssertEqual(viewmodel.galleries[0].caption, "Zona Infinite World di Jatim Park 3")
        XCTAssertEqual(viewmodel.galleries[0].thumbnail, "https://images2.imgbox.com/52/1b/PMfvPUxo_o.jpg")
        XCTAssertEqual(viewmodel.galleries[0].image, "https://images2.imgbox.com/0a/e7/G421oy0Q_o.jpg")
        XCTAssertFalse(viewmodel.loading)
    }
    
    @MainActor
    func testListPin() {
        var cancellables = Set<AnyCancellable>()
        let expectation = expectation(description: "Pins loaded")
        let mockService = MockNetworkService()
        let viewmodel = MapsViewModel(mockService)
        
        viewmodel.$pins
            .dropFirst()
            .sink { @MainActor _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewmodel.fetchPins()
        
        waitForExpectations(timeout: 1)
        XCTAssertEqual(viewmodel.pins.count, 3)
        XCTAssertEqual(viewmodel.pins[0].name, "Alun Alun Malang")
        XCTAssertEqual(viewmodel.pins[0].lokasi, 1)
        XCTAssertEqual(viewmodel.pins[0].latitude, -7.982914)
        XCTAssertEqual(viewmodel.pins[0].longitude, 112.630875)
        XCTAssertFalse(viewmodel.loading)
    }
    
    @MainActor
    func testChangelog() {
        let viewmodel = ChangelogViewModel()
        
        XCTAssertEqual(viewmodel.changelog.count, 7)
        
        // first entry
        XCTAssertEqual(viewmodel.changelog[0].version, "1.2.4")
        XCTAssertEqual(viewmodel.changelog[0].id, "1.2.4")
    }
    
    @MainActor
    func testLibrary() {
        let viewmodel = LibraryViewModel()
        
        XCTAssertEqual(viewmodel.libraries.count, 4)
        
        // first entry - Alamofire
        XCTAssertEqual(viewmodel.libraries[0].name, "Alamofire")
        XCTAssertEqual(viewmodel.libraries[0].id, "Alamofire")
        XCTAssertTrue(viewmodel.libraries[0].url.contains("cocoapods.org/pods/Alamofire"))
        XCTAssertTrue(viewmodel.libraries[0].license.contains("The MIT License (MIT)"))
        XCTAssertTrue(viewmodel.libraries[0].license.contains("Copyright (c) 2019 Wei Wang"))
        
        // third entry - GoogleMaps (non-MIT license)
        XCTAssertEqual(viewmodel.libraries[2].name, "GoogleMaps")
        XCTAssertTrue(viewmodel.libraries[2].license.contains("Google Maps Platform License Agreement"))
        
        // last entry - Kingfisher
        XCTAssertEqual(viewmodel.libraries[3].name, "Kingfisher")
        XCTAssertEqual(viewmodel.libraries[3].id, "Kingfisher")
        XCTAssertTrue(viewmodel.libraries[3].url.contains("cocoapods.org/pods/Kingfisher"))
        XCTAssertTrue(viewmodel.libraries[3].license.contains("Copyright (c) 2015-2021 Alamofire Software Foundation"))
        
        // shared MIT text present in MIT-licensed entries
        XCTAssertTrue(viewmodel.libraries[0].license.contains("Permission is hereby granted"))
    }
    
    @MainActor
    func testListPlace() {
        var cancellables = Set<AnyCancellable>()
        let expectation = expectation(description: "Places loaded")
        let mockService = MockNetworkService()
        let viewmodel = ListPlaceViewModel(mockService)
        
        viewmodel.$places
            .dropFirst() // skip initial empty value
            .sink { @MainActor _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewmodel.fetchPlaces(Location.semua)
        
        waitForExpectations(timeout: 1)
        XCTAssertEqual(viewmodel.places.count, 3)
    }

}
