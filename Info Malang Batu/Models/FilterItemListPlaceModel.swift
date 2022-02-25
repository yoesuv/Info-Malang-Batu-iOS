//
//  FilterItemListPlaceModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 25/02/22.
//

import Foundation

struct FilterItemListPlaceModel: Identifiable {
    var id = UUID().uuidString
    var title: String
    var checked: Bool
    var location: Location
}
