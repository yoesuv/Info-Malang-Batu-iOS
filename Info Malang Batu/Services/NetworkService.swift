//
//  NetworkService.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetchPlaces(_ location: Location, resultSuccess: @escaping ([PlaceModel]) -> Void, resultError: @escaping (AFError?) -> Void)
}

class NetworkService : NetworkServiceProtocol {
    
    func fetchPlaces(_ location: Location, resultSuccess: @escaping ([PlaceModel]) -> Void, resultError: @escaping (AFError?) -> Void) {
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
                case .success(_) :
                    resultSuccess(response.value ?? [])
                case .failure(_) :
                    resultError(response.error)
                }
            }
    }
    
    func fetchGalleries(result: @escaping (DataResponse<[GalleryModel], AFError>) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/Gallery_Malang_Batu.json", method: .get)
            .responseDecodable(of: [GalleryModel].self) { response in
                result(response)
            }
    }
    
    func fetchPins(result: @escaping (DataResponse<[PinModel], AFError>) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/Maps_Malang_Batu.json", method: .get)
            .responseDecodable(of: [PinModel].self) { response in
                result(response)
            }
    }
    
}
