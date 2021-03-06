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
        FilterItemListPlaceModel(title: "Semua", location: Location.semua),
        FilterItemListPlaceModel(title: "Kab Malang", location: Location.kab_malang),
        FilterItemListPlaceModel(title: "Kota Batu", location: Location.kota_batu),
        FilterItemListPlaceModel(title: "Kota Malang", location: Location.kota_malang),
    ]
    
    private let networkService = NetworkService()
    
    func fetchPlaces(_ location: Location) {
        networkService.fetchPlaces(location) { response in
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
