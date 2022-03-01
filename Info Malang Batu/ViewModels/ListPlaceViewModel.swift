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
    @Published var filters = [
        FilterItemListPlaceModel(title: "Semua", checked: true, location: Location.semua),
        FilterItemListPlaceModel(title: "Kab Malang", checked: false, location: Location.kab_malang),
        FilterItemListPlaceModel(title: "Kota Batu", checked: false, location: Location.kota_batu),
        FilterItemListPlaceModel(title: "Kota Malang", checked: false, location: Location.kota_malang),
    ]
    
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
