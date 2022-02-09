//
//  LibraryViewModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 09/02/22.
//

import Foundation

class LibraryViewModel: ObservableObject {
    
    @Published var libraries = [LibraryModel]()
    
    init() {
        libraries.append(LibraryModel(name: "Alamofire", url: "https://cocoapods.org/pods/Alamofire", license: ""))
        libraries.append(LibraryModel(name: "Kingfisher", url: "https://cocoapods.org/pods/Kingfisher", license: ""))
    }
    
}
