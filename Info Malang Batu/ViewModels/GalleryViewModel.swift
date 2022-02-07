//
//  GalleryViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 07/02/22.
//

import Foundation

class GalleryViewModel: ObservableObject {
    
    @Published var places = [GalleryModel]()
    
    private let networkService = NetworkService()
    
    func fetchGalleries() {
        networkService.fetchGalleries{ response in
            if (response.error == nil) {
                if let count = response.value?.count {
                    print("GalleryViewModel # success data count \(count)")
                }
                self.places = response.value ?? []
            } else {
                print("GalleryViewModel # error \(response.error!)")
            }
        }
    }
}
