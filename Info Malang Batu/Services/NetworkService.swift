//
//  NetworkService.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation
@preconcurrency import Alamofire

protocol NetworkServiceProtocol: Sendable {
    func fetchPlaces(_ location: Location, resultSuccess: @escaping @MainActor ([PlaceModel]) -> Void, resultError: @escaping @MainActor (AFError?) -> Void)
    func fetchGalleries(resultSuccess: @escaping @MainActor ([GalleryModel]) -> Void, resultError: @escaping @MainActor (AFError?) -> Void)
    func fetchPins(resultSuccess: @escaping @MainActor ([PinModel]) -> Void, resultError: @escaping @MainActor (AFError?) -> Void)
}

final class NetworkService: NetworkServiceProtocol, Sendable {
    
    func fetchPlaces(_ location: Location, resultSuccess: @escaping @MainActor ([PlaceModel]) -> Void, resultError: @escaping @MainActor (AFError?) -> Void) {
        var urlListPlace: String = ""
        switch location {
        case .semua:
            urlListPlace = "https://info-malang-batu.firebaseapp.com/List_place_malang_batu.json"
        case .kab_malang:
            urlListPlace = "https://info-malang-batu.firebaseapp.com/List_place_kab_malang.json"
        case .kota_batu:
            urlListPlace = "https://info-malang-batu.firebaseapp.com/List_place_kota_batu.json"
        case .kota_malang:
            urlListPlace = "https://info-malang-batu.firebaseapp.com/List_place_kota_malang.json"
        }
        AF.request(urlListPlace, method: .get)
            .responseDecodable(of: [PlaceModel].self) { response in
                switch response.result {
                case .success:
                    Task { @MainActor in
                        resultSuccess(response.value ?? [])
                    }
                case .failure:
                    Task { @MainActor in
                        resultError(response.error)
                    }
                }
            }
    }
    
    func fetchGalleries(resultSuccess: @escaping @MainActor ([GalleryModel]) -> Void, resultError: @escaping @MainActor (AFError?) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/Gallery_Malang_Batu.json", method: .get)
            .responseDecodable(of: [GalleryModel].self) { response in
                switch response.result {
                case .success:
                    Task { @MainActor in
                        resultSuccess(response.value ?? [])
                    }
                case .failure:
                    Task { @MainActor in
                        resultError(response.error)
                    }
                }
            }
    }
    
    func fetchPins(resultSuccess: @escaping @MainActor ([PinModel]) -> Void, resultError: @escaping @MainActor (AFError?) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/Maps_Malang_Batu.json", method: .get)
            .responseDecodable(of: [PinModel].self) { response in
                switch response.result {
                case .success:
                    Task { @MainActor in
                        resultSuccess(response.value ?? [])
                    }
                case .failure:
                    Task { @MainActor in
                        resultError(response.error)
                    }
                }
            }
    }
    
}
