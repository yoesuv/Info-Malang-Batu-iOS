//
//  GalleryViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

@MainActor
class GalleryViewModel: ObservableObject {
    
    @Published var galleries = [GalleryModel]()
    @Published var loading: Bool = true
    
    private let networkService: any NetworkServiceProtocol
    
    init(_ networkService: any NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchGalleries() {
        loading = true
        networkService.fetchGalleries { [weak self] data in
            guard let self else { return }
            self.loading = false
            print("GalleryViewModel # success data count \(data.count)")
            self.galleries = data
        } resultError: { [weak self] error in
            guard let self else { return }
            self.loading = false
            if let err = error {
                print("GalleryViewModel # error \(err)")
            }
        }
    }
}
