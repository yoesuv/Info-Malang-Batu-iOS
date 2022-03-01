//
//  GalleryViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

class GalleryViewModel: ObservableObject {
    
    @Published var galleries = [GalleryModel]()
    @Published var loading: Bool = true
    
    private let networkService = NetworkService()
    
    func fetchGalleries() {
        loading = true
        networkService.fetchGalleries{ response in
            self.loading = false
            if (response.error == nil) {
                if let count = response.value?.count {
                    print("GalleryViewModel # success data count \(count)")
                }
                self.galleries = response.value ?? []
            } else {
                print("GalleryViewModel # error \(response.error!)")
            }
        }
    }
}
