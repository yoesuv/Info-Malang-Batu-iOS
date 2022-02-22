//
//  ListPlaceViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

class ListPlaceViewModel: ObservableObject {
    
    @Published var places = [PlaceModel]()
    @Published var loading: Bool = true
    
    private let networkService = NetworkService()
    
    func fetchPlaces() {
        loading = true
        networkService.fetchPlaces{ response in
            self.loading = false
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
