//
//  MapsViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 10/02/22.
//

import Foundation

@MainActor
class MapsViewModel: ObservableObject {
    
    @Published var pins = [PinModel]()
    @Published var loading: Bool = true
    
    private let networkService: any NetworkServiceProtocol
    
    init(_ networkService: any NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchPins() {
        loading = true
        networkService.fetchPins { [weak self] data in
            guard let self else { return }
            self.loading = false
            print("MapsViewModel # success data count \(data.count)")
            self.pins = data
        } resultError: { [weak self] error in
            guard let self else { return }
            self.loading = false
            if let err = error {
                print("MapsViewModel # error \(err)")
            }
        }
    }
    
}
