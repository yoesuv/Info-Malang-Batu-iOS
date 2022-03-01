//
//  NetworkService.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation
import Alamofire

class NetworkService {
    
    func fetchPlaces(result: @escaping (DataResponse<[PlaceModel], AFError>) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/List_place_malang_batu.json", method: .get)
            .responseDecodable(of: [PlaceModel].self) { response in
                result(response)
        }
    }
    
    func fetchKotaBatuPlaces(result: @escaping (DataResponse<[PlaceModel], AFError>) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/List_place_kota_batu.json", method: .get)
            .responseDecodable(of: [PlaceModel].self) { response in
                result(response)
        }
    }
    
    func fetchKotaMalangPlaces(result: @escaping (DataResponse<[PlaceModel], AFError>) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/List_place_kota_malang.json", method: .get)
            .responseDecodable(of: [PlaceModel].self) { response in
                result(response)
        }
    }
    
    func fetchKabMalangPlaces(result: @escaping (DataResponse<[PlaceModel], AFError>) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/List_place_kab_malang.json", method: .get)
            .responseDecodable(of: [PlaceModel].self) { response in
                result(response)
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
