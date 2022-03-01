//
//  MapsViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 10/02/22.
//

import Foundation

class MapsViewModel: ObservableObject {
    
    @Published var pins = [PinModel]()
    @Published var loading: Bool = true
    
    private let networkService = NetworkService()
    
    func fetchPins() {
        loading = true
        networkService.fetchPins { response in
            self.loading = false
            if (response.error == nil) {
                if let count = response.value?.count {
                    print("MapsViewModel # success data count \(count)")
                }
                self.pins = response.value ?? []
            } else {
                print("MapsViewModel # error \(response.error!)")
            }
        }
    }
    
}
