//
//  MapsViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 10/02/22.
//

import Foundation

class MapsViewModel: ObservableObject {
    
    @Published var pins = [PinModel]()
    
    private let networkService = NetworkService()
    
    func fetchPins() {
        networkService.fetchPins { response in
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
