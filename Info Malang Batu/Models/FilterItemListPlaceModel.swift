//
//  FilterItemListPlaceModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 25/02/22.
//

import Foundation

struct FilterItemListPlaceModel: Identifiable, Sendable {
    let id: String
    let title: String
    let location: Location
    
    init(title: String, location: Location) {
        self.id = UUID().uuidString
        self.title = title
        self.location = location
    }
}
