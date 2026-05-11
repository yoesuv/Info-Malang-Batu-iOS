//
//  MockNetworkService.swift
//  Info Malang BatuTests
//
//  Created by Yusuf Saifudin on 26/05/24.
//

import Foundation
@preconcurrency import Alamofire
@testable import Info_Malang_Batu

final class MockNetworkService: NetworkServiceProtocol, Mockable, Sendable {
    
    func fetchPlaces(
        _ location: Location,
        resultSuccess: @escaping @MainActor ([PlaceModel]) -> Void,
        resultError: @escaping @MainActor (AFError?) -> Void
    ) {
        do {
            let data = try loadJSON(filename: "ListPlaceResponse", type: [PlaceModel].self)
            Task { @MainActor in
                resultSuccess(data)
            }
        } catch {
            Task { @MainActor in
                resultError(AFError.explicitlyCancelled)
            }
        }
    }
    
    func fetchGalleries(
        resultSuccess: @escaping @MainActor ([GalleryModel]) -> Void,
        resultError: @escaping @MainActor (AFError?) -> Void
    ) {
        do {
            let data = try loadJSON(filename: "GalleryResponse", type: [GalleryModel].self)
            Task { @MainActor in
                resultSuccess(data)
            }
        } catch {
            Task { @MainActor in
                resultError(AFError.explicitlyCancelled)
            }
        }
    }
    
    func fetchPins(
        resultSuccess: @escaping @MainActor ([PinModel]) -> Void,
        resultError: @escaping @MainActor (AFError?) -> Void
    ) {
        do {
            let data = try loadJSON(filename: "MapsPinResponse", type: [PinModel].self)
            Task { @MainActor in
                resultSuccess(data)
            }
        } catch {
            Task { @MainActor in
                resultError(AFError.explicitlyCancelled)
            }
        }
    }
    
}
