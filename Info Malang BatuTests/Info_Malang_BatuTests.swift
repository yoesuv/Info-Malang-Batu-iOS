//
//  Info_Malang_BatuTests.swift
//  Info Malang BatuTests
//
//  Created by Yusuf Saifudin on 20/05/24.
//

import XCTest
@testable import Info_Malang_Batu

final class Info_Malang_BatuTests: XCTestCase {
    
    func testListPlace() {
        let mockService = MockNetworkService()
        let viewmodel = ListPlaceViewModel(mockService)
        viewmodel.fetchPlaces(Location.semua)
        XCTAssertTrue(viewmodel.places.count == 60)
    }

}
