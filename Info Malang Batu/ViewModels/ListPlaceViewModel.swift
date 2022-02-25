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
                    print("ListPlaceViewModel # \(#function) success data count \(count)")
                }
                self.places = response.value ?? []
            } else {
                print("ListPlaceViewModel # \(#function) error \(response.error!)")
            }
        }
    }
    
    func fetchKotaBatuPlaces() {
        loading = true
        networkService.fetchKotaBatuPlaces{ response in
            self.loading = false
            if (response.error == nil) {
                if let count = response.value?.count {
                    print("ListPlaceViewModel # \(#function) success data count \(count)")
                }
                self.places = response.value ?? []
            } else {
                print("ListPlaceViewModel # \(#function) error \(response.error!)")
            }
        }
    }
    
    func fetchKotaMalangPlaces() {
        loading = true
        networkService.fetchKotaMalangPlaces{ response in
            self.loading = false
            if (response.error == nil) {
                if let count = response.value?.count {
                    print("ListPlaceViewModel # \(#function) success data count \(count)")
                }
                self.places = response.value ?? []
            } else {
                print("ListPlaceViewModel # \(#function) error \(response.error!)")
            }
        }
    }
    
    func fetchKabMalangPlaces() {
        loading = true
        networkService.fetchKabMalangPlaces{ response in
            self.loading = false
            if (response.error == nil) {
                if let count = response.value?.count {
                    print("ListPlaceViewModel # \(#function) success data count \(count)")
                }
                self.places = response.value ?? []
            } else {
                print("ListPlaceViewModel # \(#function) error \(response.error!)")
            }
        }
    }
    
}
