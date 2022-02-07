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
    
    func fetchGalleries(result: @escaping (DataResponse<[GalleryModel], AFError>) -> Void) {
        AF.request("https://info-malang-batu.firebaseapp.com/Gallery_Malang_Batu.json", method: .get)
            .responseDecodable(of: [GalleryModel].self) { response in
                result(response)
        }
    }
    
}
