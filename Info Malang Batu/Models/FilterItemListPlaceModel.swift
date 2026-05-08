//
//  FilterItemListPlaceModel.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 25/02/22.
//

import Foundation

struct FilterItemListPlaceModel: Identifiable, Sendable {
    let id = UUID().uuidString
    let title: String
    let location: Location
}
