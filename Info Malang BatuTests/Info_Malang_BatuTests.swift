//
//  Info_Malang_BatuTests.swift
//  Info Malang BatuTests
//
//  Created by Yusuf Saifudin on 20/05/24.
//

import XCTest
@preconcurrency import Combine
@testable import Info_Malang_Batu

final class Info_Malang_BatuTests: XCTestCase {
    
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
        XCTAssertEqual(viewmodel.places.count, 60)
    }

}
