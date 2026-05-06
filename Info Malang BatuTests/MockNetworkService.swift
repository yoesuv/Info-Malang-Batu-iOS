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
        do {
            let data = try loadJSON(filename: "ListPlaceResponse", type: [PlaceModel].self)
            resultSuccess(data)
        } catch {
            resultError(AFError.explicitlyCancelled)
        }
    }
    
}
