//
//  MockNetworkService.swift
//  Info Malang BatuTests
//
//  Created by Yusuf Saifudin on 26/05/24.
//

import Foundation
import Alamofire
@testable import Info_Malang_Batu

class MockNetworkService : NetworkServiceProtocol, Mockable {
    
    func fetchPlaces(_ location: Location, resultSuccess: @escaping ([PlaceModel]) -> Void, resultError: @escaping (AFError?) -> Void) {
        let data = loadJSON(filename: "ListPlaceResponse", type: [PlaceModel].self)
        resultSuccess(data)
    }
    
}
