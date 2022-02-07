//
//  ListPlaceViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

class ListPlaceViewModel: ObservableObject {
    
    @Published var places = [PlaceModel]()
    
    private let networkService = NetworkService()
    
    func fetchPlaces() {
        networkService.fetchPlaces{ response in
            if (response.error == nil) {
                if let count = response.value?.count {
                    print("NetworkManager # success data count \(count)")
                }
                self.places = response.value ?? []
            } else {
                print("NetworkManager # error \(response.error!)")
            }
        }
    }
    
}
